# frozen_string_literal: true

class Person < ApplicationRecord
  belongs_to :franchise, optional: true
  validates :name, presence: true,
                   length: { minimum: 2 }
  validates :position, presence: true,
                       length: { minimum: 1 }

  after_save :update_franchise_rating

  def franchise=(franchise)
    @franchise = self.franchise
    super(franchise)
  end

  private

  def update_franchise_rating
    return if @franchise == franchise && !saved_change_to_rating?

    @franchise ||= franchise

    @franchise.update_rating
  end
end
