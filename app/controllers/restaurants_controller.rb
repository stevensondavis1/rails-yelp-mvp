class RestaurantsController < ApplicationController
  # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/:id
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  def create
    # logic to save a new restaurant
  end

  # ... other actions (new, edit, update, destroy)
end
