class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # /restaurants/new
  def new
    # this empty instance is for the form builder
    @restaurant = Restaurant.new
  end

  # we need to submit a form to trigger this action (not from browser)
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      # show the form again but with the @restaurant that didn’t save
      render :new, status: :unprocessable_entity
    end
  end

  private

  def restaurant_params
    # FIX: Changed :rating to :category to match the required model attribute
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
