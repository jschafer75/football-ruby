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

  def index
    @franchises = Franchise.all
  end

  def show
    @franchise = Franchise.find(params[:id])
  end

  def delete
  end

private
  def franchise_params
    params.require(:franchise).permit(:city, :mascot)
  end
end
