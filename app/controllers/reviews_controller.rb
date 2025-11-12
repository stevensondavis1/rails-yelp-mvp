class ReviewsController < ApplicationController
  def new
    # 1. Find the parent resource (Restaurant) using the ID from the URL params
    @restaurant = Restaurant.find(params[:restaurant_id])

    # 2. Initialize a new Review
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    # 3. Build the review, associating it with the restaurant
    @review = Review.new(review_params)
    @review.restaurant = @restaurant # Alternative: @restaurant.reviews.build(review_params)

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      # Re-render 'new' if validation fails
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    # Only permit the content attribute from the form
    params.require(:review).permit(:content)
  end
end
