class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def create
    Review.create(review_params)

    redirect_to reviews_path
  end

  def new
    @review = Review.new
  end

  def show
    @review = Review.find_by_id(params[:id].to_i)
  end

  private
  def review_params
    return params.require(:review).permit(:rating, :comment)
  end
end
