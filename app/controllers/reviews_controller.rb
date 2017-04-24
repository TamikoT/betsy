class ReviewsController < ApplicationController
before_action :set_review, only: [:show, :edit, :update, :destroy]



  def index
    @reviews = Review.all
  end

  def create
    Review.create(review_params)

    if @review.save
          ;flash[:notice] = 'Review was successfully created.'
          redirect_to reviews_path
        else
          flash[:notice] = "Error creating review: #{@review.errors}"
          redirect_to reviews_path
    end
  end

  def edit
     @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(params[:review])
      flash[:notice] = "Review updated"
      redirect_to reviews_path
    else
      flash[:error] = "There was an error updating your review"
      redirect_to reviews_path
    end
  end

  def new
    @review = Review.new
  end


  def show
    @review = Review.find_by_id(params[:id].to_i)
  end

  def destroy
   @review = Review.find(params[:id])
   @review.destroy
   redirect_to products_path
  end

  private
  def review_params
    return params.require(:review).permit(:rating, :comment)
  end
end
