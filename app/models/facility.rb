# frozen_string_literal: true

class Facility < ApplicationRecord
  belongs_to :franchise

  TYPES = %i[medical practice scouting meeting research technology locker dining espionage].freeze

  COST_TO_UPGRADE = [
    2_000,   # 1
    6_000,   # 2
    30_000,  # 3
    100_000, # 4
    200_000  # 5
  ].freeze

  MAX_LEVEL = 5

  def upgrade(upgrading)
    return unless self[upgrading] < MAX_LEVEL

    ActiveRecord::Base.transaction do
      franchise.funds -= COST_TO_UPGRADE[self[upgrading]]
      franchise.save!
      self[upgrading] += 1
      save!
    end
  end
end
