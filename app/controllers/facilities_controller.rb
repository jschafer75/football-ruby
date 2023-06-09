# frozen_string_literal: true

class FacilitiesController < ApplicationController
  before_action :set_facility, only: %i[show edit update destroy upgrade]
  before_action :set_franchise, only: %i[show edit update destroy upgrade]
  skip_before_action :authenticate_user!, only: [:index]

  # GET /facilities
  # GET /facilities.json
  def index
    @facilities = Facility.all
  end

  # GET /facilities/1
  # GET /facilities/1.json
  def show; end

  # GET /facilities/new
  def new
    @facility = Facility.new
  end

  # GET /facilities/1/edit
  def edit; end

  # POST /facilities
  # POST /facilities.json
  def create
    @facility = Facility.new(facility_params)

    respond_to do |format|
      if @facility.save
        format.html { redirect_to @facility, notice: 'Facility was successfully created.' }
        format.json { render :show, status: :created, location: @facility }
      else
        format.html { render :new }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facilities/1
  # PATCH/PUT /facilities/1.json
  def update
    respond_to do |format|
      if @facility.update(facility_params)
        format.html { redirect_to @facility, notice: 'Facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @facility }
      else
        format.html { render :edit }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facilities/1
  # DELETE /facilities/1.json
  def destroy
    @facility.destroy
    respond_to do |format|
      format.html { redirect_to facilities_url, notice: 'Facility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /facilities/1/upgrade
  # PATCH/PUT /facilities/1/upgrade.json
  def upgrade
    @facility.upgrade(params[:upgrading].to_sym)

    respond_to do |format|
      format.html do
        redirect_to [@franchise, @facility],
                    notice: "#{params[:upgrading].capitalize} was successfully upgraded."
      end
      format.json { render :show, status: :ok, location: [@franchise, @facility] }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_facility
    @facility = Facility.find(params[:id])
  end

  def set_franchise
    @franchise = Franchise.find(params[:franchise_id])
  end

  # Only allow a list of trusted parameters through.
  def facility_params
    params.fetch(:facility, {})
  end
end
