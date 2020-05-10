# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :franchise
  validates :name, presence: true,
                   length: { minimum: 2 }
  validates :position, presence: true,
                       length: { minimum: 1 }
end
