# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :fetch_franchise

  def after_sign_in_path_for(_resource)
    current_user.franchise ? franchise_path(current_user.franchise) : franchises_path
  end

  private

  def fetch_franchise
    @franchise = current_user.franchise
  end
end
