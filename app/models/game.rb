# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :home_team, class_name: 'Franchise'
  belongs_to :away_team, class_name: 'Franchise'
  belongs_to :league

  def play
    score_generator = Rubystats::NormalDistribution.new(23.0, 7.0)

    home_score = generate_score(score_generator.rng, home_team.offense_rating, away_team.defense_rating)
    away_score = generate_score(score_generator.rng, away_team.offense_rating, home_team.defense_rating)
    update_attributes(home_score: home_score, away_score: away_score)
  end

  private

  def generate_score(base, offense_rating, defense_rating)
    base * offense_rating / defense_rating
  end
end
