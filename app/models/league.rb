# frozen_string_literal: true

class League < ApplicationRecord
  has_many :franchises
  has_many :games

  def generate_schedule
    games_per_week = franchises.count / 2
    center = franchises.first
    top = franchises[games_per_week]
    left = franchises[1..(games_per_week - 1)]
    right = franchises[(games_per_week + 1)..-1]

    loop_round_robin_wheel(center, top, left, right)
  end

  def current_schedule
    Game.where(year: year, league: self)
  end

  def current_week_schedule
    Game.where(year: year, week: week, league: self)
  end

  def week_schedule(week)
    Game.where(year: year, week: week, league: self)
  end

  def play_week
    current_week_schedule.each(&:play)
    save!
  end

  def advance_week
    transaction do
      play_week
      self.week += 1
      save!
    end
  end

  private

  def loop_round_robin_wheel(center, top, left, right)
    (1...franchises.count).each do |w|
      if w.odd?
        create_weekly_game(w, center, top)
      else
        create_weekly_game(w, top, center)
      end
      left.each_index do |i|
        create_weekly_game(w, left[i], right[i])
      end
      right.push(top)
      left.push(right.shift)
      top = left.shift
    end
  end

  def create_weekly_game(week, home_team, away_team)
    Game.create({ home_team: home_team, away_team: away_team, week: week, league: self, year: year })
  end
end
