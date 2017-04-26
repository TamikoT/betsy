class ProductsController < ApplicationController

  before_action :require_login, :only => [:create, :new]

  def index
    @categories = Category.all
    if params[:category_id]
      @products = Product.includes(:product_categories).where(product_categories: { category_id: params[:category_id] })
    else
      @products = Product.all
    end
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = @current_user.id

    @product.status = true

    if @product.save
      flash[:notice] = 'product was successfully created.'
    else
      flash[:notice] = "Error creating product"
      flash[:messages] = @product.errors.messages
    end

    redirect_to user_path(@current_user)
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      flash[:notice] = 'product was successfully updated'
    else
      flash[:notice] = "Error updating product"
      flash[:messages] = @product.errors.messages
    end
  end


  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find_by(id: params[:id])
  end




  def add_category
    raise
    new_category = ProductCategory.new(product_id: params[:id], category_id: params[:category])
    if new_category.save
      flash[:status] = :success
      flash[:result_text] = "Successfluffy categorized #{product.name} as #{category.name}"
    else
      flash[:status] = :failure
      flash[:result_text] = 'Unable to add category'
      flash[:messages] = new_category.errors.messages
    end
    redirect_to user_path(@current_user)
  end


  private

  def product_params
    params.require(:product).permit(:stock, :name, :photo, :description, :price, :status )
    # Did not add photos to product_params.
  end

end
