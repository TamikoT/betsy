class ProductsController < ApplicationController
    def index
        @categories = Category.all
        if params[:category_id]
            @products = Product.includes(:product_categories).where(product_categories: { category_id: params[:category_id] })
        else
            @products = Product.all
        end
    end

    def create
        Product.create(product_params)

        redirect_to products_path
    end

    def new
        @products = Product.new
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

    def remove_category; end

    private

    def product_params
        params.require(:product).permit(:stock, :name, :price, :user_id, :status)
        # Did not add photos to product_params.
    end
end
