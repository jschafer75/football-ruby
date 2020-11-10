# frozen_string_literal: true

class Franchise < ApplicationRecord
  has_many :people
  has_many :games
  has_one :stadium
  has_one :facility
  belongs_to :league
  belongs_to :user, optional: true
  validates :city, presence: true,
                   length: { minimum: 2 }
  validates :mascot, presence: true,
                     length: { minimum: 2 }

  after_initialize do
    if new_record?
      fill_players
      fill_coaches
      generate_infrastructure
    end
  end

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

  OFFENSE_POITIONS = %w[QB RB TE WR OL].freeze
  DEFENSE_POITIONS = %w[DL LB S CB].freeze

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
    Game.where("home_team_id = #{id} OR away_team_id = #{id}").where(year: league.year).order(:week)
  end

  def generate_infrastructure
    Stadium.create(franchise: self)
    Facility.create(franchise: self)
  end

  def current_game
    game(league.year, league.week)
  end

  def game(year, week)
    Game.where(league: league, year: year, week: week)
  end

  def update_rating
    offense_ratings = players.select { |p| Franchise::OFFENSE_POITIONS.include?(p.position) }.collect(&:rating)
    defense_ratings = players.select { |p| Franchise::DEFENSE_POITIONS.include?(p.position) }.collect(&:rating)
    self.offense_rating = average(offense_ratings)
    self.defense_rating = average(defense_ratings)
    save!
  end

  def rating
    average([offense_rating, defense_rating])
  end

  def update_payroll
    self.payroll = people.map(&:salary).sum
    save!
  end

  private

  def average(array)
    return 0 if array.empty?

    array.sum / array.size
  end
end
