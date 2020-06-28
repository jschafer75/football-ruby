# frozen_string_literal: true

class Stadium < ApplicationRecord
  belongs_to :franchise

  def size_name
    case size
    when 1
      'small'
    when 2
      'medium'
    when 3
      'large'
    else
      'none'
    end
  end
end
