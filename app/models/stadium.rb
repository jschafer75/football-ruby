# frozen_string_literal: true

class Stadium < ApplicationRecord
  belongs_to :franchise

  enum size: %i[none tiny small medium large extra_large], _prefix: true

  COST_TO_UPGRADE = {
    tiny: 10_000,
    small: 30_000,
    medium: 150_000,
    large: 500_000,
    extra_large: 1_000_000
  }.freeze
end
