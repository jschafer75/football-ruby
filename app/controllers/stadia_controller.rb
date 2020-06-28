# frozen_string_literal: true

class StadiaController < ApplicationController
  def build_stadium
    @franchise = Franchise.find(params[:franchise_id])
    @stadium = Stadium.create(size: 1, franchise: @franchise)

    redirect_to franchise_path(@franchise)
  end
end
