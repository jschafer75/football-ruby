# frozen_string_literal: true

PLAY_LENGTHS = {
  'run' => {
    'short' => 3,
    'medium' => 8,
    'long' => 15
  },
  'pass' => {
    'short' => 5,
    'medium' => 20,
    'long' => 35
  }
}.freeze

PASS_COMPLETION_PCT = {
  'short' => 0.70,
  'medium' => 0.50,
  'long' => 0.30
}.freeze

class PlaySimulator
  def initialize(params)
    @offense = params[:offense]
    @defense = params[:defense]
    @distribution = Rubystats::BetaDistribution.new(2, 1)
    puts "Offense: #{@offense.full_name} (#{@offense.offense_rating})"
    puts "Defense: #{@defense.full_name} (#{@defense.defense_rating})"
  end

  def execute(play_type = 'run', play_length = 'short')
    base_yards = PLAY_LENGTHS[play_type][play_length] * offense_rating(play_type) / defense_rating(play_type)

    yards_gained = (base_yards * @distribution.icdf(rand) / 0.7).floor

    if (play_type == 'pass') && (rand > PASS_COMPLETION_PCT[play_length])
      0
    else
      yards_gained
    end
  end

  def offense_rating(play_type)
    if play_type == 'run'
      @offense.rush_offense_rating
    else
      @offense.pass_offense_rating
    end
  end

  def defense_rating(play_type)
    if play_type == 'run'
      @defense.rush_defense_rating
    else
      @defense.pass_defense_rating
    end
  end
end
