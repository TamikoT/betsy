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

    def new
        @product = Product.new
    end

    def edit
        @product = Product.find(params[:id])
    end

    def show
        @product = Product.find_by(id: params[:id])
    end

    def update
        product = Product.find(params[:id])
        product.update(product_params)
    end

    def add_category
        new_category = ProductCategory.new(product_id: params[:product_id], category_id: params[:category][:id])
        if new_category.save
            flash[:status] = :success
            flash[:result_text] = "Successfluffy categorized #{Product.find_by(id: params[:id]).name} as #{Category.find_by(id: params[:category][:id]).name}"
        else
            flash[:status] = :failure
            flash[:result_text] = 'Unable to add category'
            flash[:messages] = new_category.errors.messages
        end
        redirect_to user_path(@current_user)
    end

    def remove_category
        deleted_category = ProductCategory.find_by(product_id: params[:id], category_id: params[:category_id])
        deleted_category.destroy
        flash[:status] = :success
        flash[:result_text] = "Successfluffy removed #{Product.find_by(id: params[:id]).name} from #{Category.find_by(id: params[:category_id]).name}"
        redirect_to user_path(@current_user)
    end

    private

    def product_params
        params.require(:product).permit(:stock, :name, :photo, :description, :price)
        # Did not add photos to product_params.
    end
end
