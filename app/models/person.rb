# frozen_string_literal: true

class Person < ApplicationRecord
  belongs_to :franchise, optional: true
  validates :name, presence: true,
                   length: { minimum: 2 }
  validates :position, presence: true,
                       length: { minimum: 1 }
end
