# frozen_string_literal: true

class Franchise < ApplicationRecord
  has_many :people
  validates :city, presence: true,
                   length: { minimum: 2 }
  validates :mascot, presence: true,
                     length: { minimum: 2 }

  def coaches
    Person.where(role: 'coach')
  end

  def players
    Person.where(role: 'player')
  end
end
