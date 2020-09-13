# frozen_string_literal: true

module ApplicationHelper
  def background_color
    if current_user&.franchise
      current_user.franchise.secondary_color
    else
      'lightgray'
    end
  end

  def foreground_color
    if current_user&.franchise
      current_user.franchise.primary_color
    else
      'black'
    end
  end
end
