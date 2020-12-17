class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    if logged_in?
      @review = Review.create(
        body: review_params[:body],
        restaurant_id: review_params[:restaurant_id],
        user_id: current_user.id
      )

      p review_params[:images]

      @review.images.attach(review_params[:images])
      @review.tag_list = review_params[:tag_list]
      @review.save

      redirect_to(restaurant_path(review_params[:restaurant_id]))
    else
      flash[:error] = "Must log in"
      render "new"
    end
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:body, :restaurant_id, :tag_list, :rating, :images => [])
  end
end
