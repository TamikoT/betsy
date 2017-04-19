class CategoriesController < ApplicationController
  def create
    Category.create(category_params)

    redirect_to categories_path
  end

  def new
    @category = Category.new
  end

  private
  def category_params
    return params.require(:category).permit(:name)
  end
end
