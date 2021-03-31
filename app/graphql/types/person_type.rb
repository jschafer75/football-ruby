# frozen_string_literal: true

module Types
  class PersonType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :position, String, null: false
    field :role, String, null: false
    field :franchise_id, Integer, null: true
    field :rating, Integer, null: false
    field :age, Integer, null: false
    field :salary, Integer, null: true
  end
end
