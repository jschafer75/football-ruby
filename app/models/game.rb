# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :home_team, class_name: 'Franchise'
  belongs_to :away_team, class_name: 'Franchise'
  belongs_to :league

  def play
    home_score = home_team.rating / 3
    away_score = away_team.rating / 3
    update_attributes(home_score: home_score, away_score: away_score)
  end
end
