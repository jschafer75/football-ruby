# frozen_string_literal: true

class Stadium < ApplicationRecord
  belongs_to :franchise

  enum size: %i[tiny small medium large extra_large]
end
