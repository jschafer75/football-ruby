# frozen_string_literal: true

module Types
  class LeagueType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :year, Integer, null: true
    field :week, Integer, null: true
    field :category, Integer, null: false
  end
end
