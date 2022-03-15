class PlacesController < ApplicationController

  def index
    @places = Place.where({user_id: @current_user.id})
  end

  def show
    @place = Place.find(params["id"])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(params["place"])
    @place.save
    redirect_to "/places"
  end

end
