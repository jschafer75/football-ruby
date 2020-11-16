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
    @old_franchise&.update_rating
    franchise&.update_rating if @old_franchise != franchise
  end

  def update_franchise_payroll
    @old_franchise&.update_payroll
    franchise&.update_payroll if @old_franchise != franchise
  end
end
