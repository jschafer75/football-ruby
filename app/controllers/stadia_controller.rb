# frozen_string_literal: true

class StadiaController < ApplicationController
  before_action :set_stadium, only: %i[show edit update destroy upgrade]
  before_action :set_franchise, only: %i[show edit update destroy upgrade]

  # PATCH/PUT /stadium/1/upgrade
  # PATCH/PUT /stadium/1/upgrade.json
  def upgrade
    @stadium.upgrade

    respond_to do |format|
      format.html do
        redirect_to @franchise, notice: 'Stadium was successfully upgraded.'
      end
      format.json { render :show, status: :ok, location: @franchise }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stadium
    @stadium = Stadium.find(params[:id])
  end

  def set_franchise
    @franchise = Franchise.find(params[:franchise_id])
  end
end
