# frozen_string_literal: true

class Person < ApplicationRecord
  belongs_to :franchise, optional: true
  validates :name, presence: true,
                   length: { minimum: 2 }
  validates :position, presence: true,
                       length: { minimum: 1 }

  after_save :update_franchise_rating
  after_save :update_franchise_payroll

  def franchise=(franchise)
    @old_franchise = self.franchise
    super(franchise)
  end

  private

  def update_franchise_rating
    return unless saved_change_to_rating? || (@old_franchise != franchise)

    @old_franchise&.update_rating
    franchise&.update_rating
  end

  def update_franchise_payroll
    return unless saved_change_to_salary? || (@old_franchise != franchise)

    @old_franchise&.update_payroll
    franchise&.update_payroll
  end
end
