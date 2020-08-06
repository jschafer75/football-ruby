# frozen_string_literal: true

class Franchise < ApplicationRecord
  has_many :people
  has_many :games
  has_one :stadium
  has_one :facility
  belongs_to :league
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

  def full_name
    "#{city} #{mascot}"
  end

  def fill_players
    PLAYER_DEFAULTS.each_key do |position|
      (PLAYER_DEFAULTS[position] - players.where(position: position).count).times do
        PersonGenerator.create_person('player', self, position)
      end
    end
  end

  def fill_coaches
    COACH_DEFAULTS.each_key do |position|
      (COACH_DEFAULTS[position] - coaches.where(position: position).count).times do
        PersonGenerator.create_person('coach', self, position)
      end
    end
  end

  def current_schedule
    league.current_schedule.select { |g| g.away_team == self || g.home_team == self }
  end

  def generate_infrastructure
    Facility.create(franchise: self)
  end
end
