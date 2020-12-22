# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    current_user.franchise ? franchise_path(current_user.franchise) : page_path('welcome')
  end
end
