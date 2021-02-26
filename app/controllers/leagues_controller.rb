# frozen_string_literal: true

class LeaguesController < ApplicationController
  before_action :fetch_league

  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = League.all
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show; end

  # GET /leagues/new
  def new
    @league = League.new
  end

  # GET /leagues/1/edit
  def edit; end

  # POST /leagues
  # POST /leagues.json
  def create
    @league = League.new(league_params)

    respond_to do |format|
      if @league.save
        format.html { redirect_to @league, notice: 'League was successfully created.' }
        format.json { render :show, status: :created, location: @league }
      else
        format.html { render :new }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leagues/1
  # PATCH/PUT /leagues/1.json
  def update
    respond_to do |format|
      if @league.update(league_params)
        format.html { redirect_to @league, notice: 'League was successfully updated.' }
        format.json { render :show, status: :ok, location: @league }
      else
        format.html { render :edit }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @league.destroy
    respond_to do |format|
      format.html { redirect_to leagues_url, notice: 'League was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /leagues/1/generate_schedule
  # PATCH/PUT /leagues/1/generate_schedule.json
  def generate_schedule
    @league.generate_schedule
    respond_to do |format|
      format.html { redirect_to @league, notice: 'League schedule was successfully generated.' }
      format.json { render :show, status: :ok, location: @league }
    end
  end

  # GET /leagues/1/schedule
  # GET /leagues/1/schedule.json
  def schedule; end

  # PATCH/PUT /leagues/1/advance_week
  # PATCH/PUT /leagues/1/advance_week.json
  def play_week
    @league.play_week
    respond_to do |format|
      format.html { redirect_to schedule_league_url }
      format.json { render :show, status: :ok, location: @league }
    end
  end

  # PATCH/PUT /leagues/1/advance_week
  # PATCH/PUT /leagues/1/advance_week.json
  def advance_week
    @league.advance_week
    respond_to do |format|
      format.html { redirect_to schedule_league_url }
      format.json { render :show, status: :ok, location: @league }
    end
  end

  # PATCH/PUT /leagues/1/new_season
  # PATCH/PUT /leagues/1/new_season.json
  def new_season
    @league.new_season
    respond_to do |format|
      format.html { redirect_to schedule_league_url }
      format.json { render :show, status: :ok, location: @league }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def fetch_league
    @league = League.find(params[:id]) if params[:id]
  end

  # Only allow a list of trusted parameters through.
  def league_params
    params.require(:league).permit(:name)
  end
end
