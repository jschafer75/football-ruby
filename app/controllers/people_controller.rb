# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :fetch_franchise
  before_action :fetch_role
  before_action :fetch_person

  def new
    @person = Person.new(role: @role)
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to [@franchise, @person]
    else
      render 'new'
    end
  end

  def edit; end

  def index
    @people = Person.where(role: @role)
  end

  def show; end

  def update
    if @person.update(person_params)
      redirect_to [@franchise, @person]
    else
      render 'edit'
    end
  end

  def destroy
    @person.destroy

    redirect_to [@franchise, @person, role: @role]
  end

  def sign
    @person.franchise = @franchise
    @person.save

    redirect_to [@franchise, @person]
  end

  def release
    @person.franchise = nil
    @person.save

    redirect_to [@franchise, @person]
  end

  def generate_random
    @person = PersonGenerator.create_person(params[:role] || 'player')

    if @person.id
      redirect_to [@franchise, @person]
    else
      render 'new'
    end
  end

  private

  def person_params
    params.require(:person).permit(:name, :position, :role)
  end

  def fetch_franchise
    @franchise = Franchise.find(params[:franchise_id])
  end

  def fetch_role
    @role = params[:role] || 'player'
  end

  def fetch_person
    @person = Person.find(params[:id]) if params[:id]
  end
end
