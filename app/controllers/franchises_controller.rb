# frozen_string_literal: true

class FranchisesController < ApplicationController
  def new
    @franchise = Franchise.new
  end

  def create
    @franchise = Franchise.new(franchise_params)

    if @franchise.save
      redirect_to @franchise
    else
      render 'new'
    end
  end

  def edit
    @franchise = Franchise.find(params[:id])
  end

  def index
    @franchises = Franchise.all
  end

  def show
    @franchise = Franchise.find(params[:id])
    @coaches = @franchise.coaches
    @players = @franchise.players
  end

  def update
    @franchise = Franchise.find(params[:id])

    if @franchise.update(franchise_params)
      redirect_to @franchise
    else
      render 'edit'
    end
  end

  def destroy
    @franchise = Franchise.find(params[:id])
    @franchise.destroy

    redirect_to franchises_path
  end

  private

  def franchise_params
    params.require(:franchise).permit(:city, :mascot)
  end
end
