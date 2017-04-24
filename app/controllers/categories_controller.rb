class CategoriesController < ApplicationController
    def create
        Category.create(category_params)
        redirect_to :back
    end

    def new
        @category = Category.new
    end

    def show
      @category = Category.find(params[:id])
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end


end
