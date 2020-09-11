# frozen_string_literal: true

class FranchisesController < ApplicationController
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
      @franchise.generate_infrastructure
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
    @game = Game.find(params[:game_id])
    unless @game
      @opponent = Franchise.find(params[:opponent_id])
      @game = Game.create(home_team: @franchise, away_team: @opponent)
    end
    @game.play
    render 'game_results'
  end

  def roster
    @coaches = @franchise.coaches
    @players = @franchise.players

    render 'roster'
  end

  def schedule
    @schedule = @franchise.current_schedule
    render 'schedule'
  end

  def set_user
    if params[:clear]
      @franchise.user = nil
      @franchise.save
      redirect_to franchises_path
    else
      @franchise.user = current_user
      @franchise.save
      redirect_to @franchise
    end
  end

  private

  def franchise_params
    params.require(:franchise)
          .permit(:city, :mascot, :rating, :generate_people, :primary_color, :secondary_color, :league_id)
  end
end
