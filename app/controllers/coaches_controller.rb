# frozen_string_literal: true

class CoachesController < ApplicationController
  def new
    @coach = Coach.new
  end

  def create
    @coach = Coach.new(coach_params)

    if @coach.save
      redirect_to @coach
    else
      render 'new'
    end
  end

  def edit
    @coach = Coach.find(params[:id])
  end

  def index
    @coaches = Coach.all
  end

  def show
    @coach = Coach.find(params[:id])
  end

  def update
    @coach = Coach.find(params[:id])

    if @coach.update(coach_params)
      redirect_to @coach
    else
      render 'edit'
    end
  end

  def destroy
    @coach = Coach.find(params[:id])
    @coach.destroy

    redirect_to coaches_path
  end

  private

  def coach_params
    params.require(:coach).permit(:name, :role)
  end
end
