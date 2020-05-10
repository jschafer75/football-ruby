# frozen_string_literal: true

class PlayersController < ApplicationController
  def new
    @franchise = Franchise.find(params[:franchise_id])
    @player = Player.new
  end

  def create
    @franchise = Franchise.find(params[:franchise_id])
    @player = Player.new(player_params)

    if @player.save
      redirect_to [@franchise, @player]
    else
      render 'new'
    end
  end

  def edit
    @franchise = Franchise.find(params[:franchise_id])
    @player = Player.find(params[:id])
  end

  def index
    @franchise = Franchise.find(params[:franchise_id])
    @players = Player.all
  end

  def show
    @franchise = Franchise.find(params[:franchise_id])
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      redirect_to [@franchise, @player]
    else
      render 'edit'
    end
  end

  def destroy
    @franchise = Franchise.find(params[:franchise_id])
    @player = Player.find(params[:id])
    @player.destroy

    redirect_to players_path
  end

  def sign
    @franchise = Franchise.find(params[:franchise_id])
    @player = Player.find(params[:id])

    @player.franchise = @franchise

    if @player.save
      redirect_to [@franchise, @player]
    else
      render 'show'
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :position)
  end
end
