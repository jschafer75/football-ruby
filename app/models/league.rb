# frozen_string_literal: true

class League < ApplicationRecord
  has_many :franchises
end
