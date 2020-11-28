# frozen_string_literal: true

class Stadium < ApplicationRecord
  belongs_to :franchise

  COST_TO_UPGRADE = [
    10_000,   # 1
    30_000,   # 2
    150_000,  # 3
    500_000,  # 4
    1_000_000 # 5
  ].freeze

  MAX_LEVEL = 5

  def upgrade
    return unless size < MAX_LEVEL

    ActiveRecord::Base.transaction do
      franchise.funds -= COST_TO_UPGRADE[size]
      franchise.save!
      self.size += 1
      save!
    end
  end
end
