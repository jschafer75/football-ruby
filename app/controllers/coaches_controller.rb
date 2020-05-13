# frozen_string_literal: true

class CoachesController < ApplicationController
  def new
    @franchise = Franchise.find(params[:franchise_id])
    @coach = Coach.new
  end

  def create
    @franchise = Franchise.find(params[:franchise_id])
    @coach = Coach.new(coach_params)

    if @coach.save
      redirect_to [@franchise, @coach]
    else
      render 'new'
    end
  end

  def edit
    @franchise = Franchise.find(params[:franchise_id])
    @coach = Coach.find(params[:id])
  end

  def index
    @franchise = Franchise.find(params[:franchise_id])
    @coaches = Coach.all
  end

  def show
    @franchise = Franchise.find(params[:franchise_id])
    @coach = Coach.find(params[:id])
  end

  def update
    @coach = Coach.find(params[:id])

    if @coach.update(coach_params)
      redirect_to [@franchise, @coach]
    else
      render 'edit'
    end
  end

  def destroy
    @franchise = Franchise.find(params[:franchise_id])
    @coach = Coach.find(params[:id])
    @coach.destroy

    redirect_to franchise_coaches_path
  end

  def sign
    @franchise = Franchise.find(params[:franchise_id])
    @coach = Coach.find(params[:id])

    @coach.franchise = @franchise
    @coach.save

    redirect_to [@franchise, @coach]
  end

  def release
    @franchise = Franchise.find(params[:franchise_id])
    @coach = Coach.find(params[:id])

    @coach.franchise = nil
    @coach.save

    redirect_to [@franchise, @coach]
  end

  private

  def coach_params
    params.require(:coach).permit(:name, :role)
  end
end
