# frozen_string_literal: true

class Facility < ApplicationRecord
  belongs_to :franchise

  enum medical: %i[none tiny small medium large extra_large], _prefix: true
  enum practice: %i[none tiny small medium large extra_large], _prefix: true
  enum scouting: %i[none tiny small medium large extra_large], _prefix: true
  enum meeting: %i[none tiny small medium large extra_large], _prefix: true
  enum research: %i[none tiny small medium large extra_large], _prefix: true
  enum technology: %i[none tiny small medium large extra_large], _prefix: true
  enum locker: %i[none tiny small medium large extra_large], _prefix: true
  enum dining: %i[none tiny small medium large extra_large], _prefix: true
  enum espionage: %i[none tiny small medium large extra_large], _prefix: true

  COST_TO_UPGRADE = {
    tiny: 2_000,
    small: 6_000,
    medium: 30_000,
    large: 100_000,
    extra_large: 200_000
  }.freeze
end
