require 'test_helper'

describe ProductsController do
  describe "index" do

    it "responds with no product" do
      skip
      Product.destroy_all

      get products_path
      must_respond_with :success
    end

    it "responds with multiple products" do
      skip
      Product.count.must_be :>, 0

      get products_path
      must_respond_with :success
    end
  end

  describe "new" do
    it "makes new product" do
      skip
    end
  end


  describe "create" do
    it "adds product to database" do
      skip
      product_data = { product: { name: "Test Name", email: "test@aol.com" } }
      post products_path, params: product_data
      # T_T not necessarily where we will redirect to
      must_redirect_to products_path
    end

    it "refreshed the form if the info sucks" do
      # test if no name is given
      skip
      product_data = { email: { email: "noname@aol.com" } }
      post products_path, params: product_data
      must_respond_with :bad_request
    end
  end

  describe "show" do
    it "responds with an existing product" do
      skip
      get product_path(Product.first)
      must_respond_with :success
    end

    it "404 with invalid product data" do
      skip
      bad_product_id = Product.last.id + 1
      get product_path(bad_product_id)
      must_respond_with :not_found
    end
  end
end
