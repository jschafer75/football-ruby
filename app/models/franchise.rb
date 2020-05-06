# frozen_string_literal: true

class Franchise < ApplicationRecord
  has_many :players
  has_many :coaches
  validates :city, presence: true,
                   length: { minimum: 2 }
  validates :mascot, presence: true,
                     length: { minimum: 2 }
end
