# frozen_string_literal: true

module Types
  class FranchiseType < Types::BaseObject
    field :id, ID, null: false
    field :city, String, null: true
    field :mascot, String, null: true
    field :primary_color, String, null: true
    field :secondary_color, String, null: true
    field :league_id, Integer, null: true
    field :user_id, Integer, null: true
    field :offense_rating, Integer, null: true
    field :defense_rating, Integer, null: true
    field :funds, Integer, null: true
    field :payroll, Integer, null: true
    field :rush_offense_rating, Integer, null: true
    field :rush_defense_rating, Integer, null: true
    field :pass_offense_rating, Integer, null: true
    field :pass_defense_rating, Integer, null: true
  end
end
