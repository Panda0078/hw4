class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params["id"])
  end

  def new
    @place = Place.new
  end

  def create
    if @current_user
      @place = Place.new(params["place"])
      @post.user_id = @current_user.id
      @place.save
    redirect_to "/places"
  end

end
