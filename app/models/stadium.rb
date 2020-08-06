# frozen_string_literal: true

class Stadium < ApplicationRecord
  belongs_to :franchise

  enum size: %i[none tiny small medium large extra_large], _prefix: true
end
