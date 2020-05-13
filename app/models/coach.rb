# frozen_string_literal: true

class Coach < ApplicationRecord
  belongs_to :franchise, optional: true
  validates :name, presence: true,
                   length: { minimum: 2 }
  validates :role, presence: true,
                   length: { minimum: 2 }
end
