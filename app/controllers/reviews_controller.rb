class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)

    redirect_to("/restaurants/#{review_params[:restaurant_id]}")
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:restaurant_id, :user_id, :body)
  end
end
