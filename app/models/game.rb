# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :home_team, class_name: 'Franchise'
  belongs_to :away_team, class_name: 'Franchise'
  belongs_to :league

  WINNING_FUNDS = 10_000_000
  LOSING_FUNDS = 5_000_000
  TIE_FUNDS = (WINNING_FUNDS + LOSING_FUNDS) / 2

  def play
    score_generator = Rubystats::NormalDistribution.new(23.0, 7.0)

    self.home_score = generate_score(score_generator, home_team, away_team)
    self.away_score = generate_score(score_generator, away_team, home_team)
    ActiveRecord::Base.transaction do
      post_game
    end
  end

  private

  def generate_score(generator, offense, defense)
    generator.rng * offense.offense_rating / defense.defense_rating
  end

  def post_game
    award_funds

    home_team.save
    away_team.save
    save
  end

  def award_funds
    if tie?
      winner.funds += TIE_FUNDS
      loser.funds += TIE_FUNDS
    else
      winner.funds += WINNING_FUNDS
      loser.funds += LOSING_FUNDS
    end

    winner.save
    loser.save
  end

  def winner
    @winner ||= if home_score >= away_score
                  home_team
                elsif away_score > home_score
                  away_team
                end
  end

  def loser
    @loser ||= if home_score >= away_score
                 away_team
               elsif away_score > home_score
                 home_team
               end
  end

  def tie?
    @tie ||= home_score == away_score
  end
end
