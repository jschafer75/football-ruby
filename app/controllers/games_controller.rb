# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :fetch_game
  before_action :fetch_teams

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params).tap(&:with_league)

    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def edit; end

  def index
    @game = Game.all
  end

  def show; end

  def update
    if @game.update(game_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  def destroy
    @game.destroy

    redirect_to games_path
  end

  def play
    @game.play
    redirect_to @game
  end

  private

  def game_params
    params.require(:game).permit(:home_team_id, :away_team_id)
  end

  def fetch_game
    @game = Game.find(params[:id]) if params[:id]
  end

  def fetch_teams
    return unless params[:game]

    @home_team = Franchise.find(params[:game][:home_team_id]) if params[:game][:home_team_id]
    @away_team = Franchise.find(params[:game][:away_team_id]) if params[:game][:away_team_id]
  end
end
