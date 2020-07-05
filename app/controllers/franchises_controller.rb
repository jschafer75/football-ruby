# frozen_string_literal: true

class FranchisesController < ApplicationController
  before_action :fetch_franchise

  def new
    @franchise = Franchise.new
  end

  def create
    generate_people = params.require(:franchise).extract!(:generate_people)
    @franchise = Franchise.new(franchise_params)

    if @franchise.save
      if generate_people
        @franchise.fill_players
        @franchise.fill_coaches
      end
      redirect_to @franchise
    else
      render 'new'
    end
  end

  def edit; end

  def index
    @franchises = Franchise.all
  end

  def show; end

  def update
    params.require(:franchise).extract!(:generate_people)
    if @franchise.update(franchise_params)
      redirect_to @franchise
    else
      render 'edit'
    end
  end

  def destroy
    @franchise.people.each do |p|
      p.franchise = nil
      p.save
    end
    @franchise.destroy

    redirect_to franchises_path
  end

  def fill_team
    @franchise.fill_players
    @franchise.fill_coaches

    redirect_to @franchise
  end

  def setup_game
    render 'setup_game'
  end

  def play_game
    @opponent = Franchise.find(params[:opponent])
    @game = Game.create(home_team: @franchise, away_team: @opponent)
    @game.play
    render 'game_results'
  end

  def roster
    @coaches = @franchise.coaches
    @players = @franchise.players

    render 'roster'
  end

  private

  def franchise_params
    params.require(:franchise).permit(:city, :mascot, :rating, :generate_people, :primary_color, :secondary_color)
  end

  def fetch_franchise
    @franchise = Franchise.find(params[:id]) if params[:id]
  end
end
