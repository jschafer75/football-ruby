# frozen_string_literal: true

class Franchise < ApplicationRecord
  has_many :people
  has_many :games
  validates :city, presence: true,
                   length: { minimum: 2 }
  validates :mascot, presence: true,
                     length: { minimum: 2 }

  PLAYER_DEFAULTS = {
    'QB' => 1,
    'RB' => 2,
    'TE' => 1,
    'WR' => 2,
    'OL' => 5,
    'DL' => 4,
    'LB' => 3,
    'S' => 2,
    'CB' => 2,
    'K' => 1,
    'P' => 1
  }.freeze

  COACH_DEFAULTS = {
    'HC' => 1,
    'OC' => 1,
    'DC' => 1
  }.freeze

  def coaches
    people.where(role: 'coach')
  end

  def players
    people.where(role: 'player')
  end

  def generate_players
    PLAYER_DEFAULTS.each_key do |position|
      PLAYER_DEFAULTS[position].times do
        PersonGenerator.create_person('player', self, position)
      end
    end
  end

  def generate_coaches
    COACH_DEFAULTS.each_key do |position|
      COACH_DEFAULTS[position].times do
        PersonGenerator.create_person('coach', self, position)
      end
    end
  end

  def full_name
    "#{city} #{mascot}"
  end
end
