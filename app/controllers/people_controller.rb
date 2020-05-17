# frozen_string_literal: true

class PeopleController < ApplicationController
  def new
    @franchise = Franchise.find(params[:franchise_id])
    @role = params[:role]
    @person = Person.new(role: @role)
  end

  def create
    @franchise = Franchise.find(params[:franchise_id])
    @person = Person.new(person_params)

    if @person.save
      redirect_to [@franchise, @person]
    else
      render 'new'
    end
  end

  def edit
    @franchise = Franchise.find(params[:franchise_id])
    @role = params[:role]
    @person = Person.find(params[:id])
  end

  def index
    @franchise = Franchise.find(params[:franchise_id])
    @role = params[:role] || 'player'
    @people = Person.where(role: @role)
  end

  def show
    @franchise = Franchise.find(params[:franchise_id])
    @role = params[:role]
    @person = Person.find(params[:id])
  end

  def update
    @franchise = Franchise.find(params[:franchise_id])
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to [@franchise, @person]
    else
      render 'edit'
    end
  end

  def destroy
    @franchise = Franchise.find(params[:franchise_id])
    @person = Person.find(params[:id])
    @person.destroy

    redirect_to [@franchise, @person]
  end

  def sign
    @franchise = Franchise.find(params[:franchise_id])
    @person = Person.find(params[:id])

    @person.franchise = @franchise
    @person.save

    redirect_to [@franchise, @person]
  end

  def release
    @franchise = Franchise.find(params[:franchise_id])
    @person = Person.find(params[:id])

    @person.franchise = nil
    @person.save

    redirect_to [@franchise, @person]
  end

  private

  def person_params
    params.require(:person).permit(:name, :position, :role)
  end
end
