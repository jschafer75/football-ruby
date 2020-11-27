# frozen_string_literal: true

class Facility < ApplicationRecord
  belongs_to :franchise

  TYPES = %i[medical practice scouting meeting research technology locker dining espionage].freeze

  def upgrade(upgrading)
    self[upgrading] += 1
    save!
  end
end
