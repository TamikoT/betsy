require "test_helper"

describe Product do
  let(:product) { Product.new }

  it "all products must be valid" do
    products.each do |product|
      value(product).must_be :valid?
    end
  end

  it "does not save" do
    product.wont_be :valid?
  end

  describe "validation tests" do
    it "product can not be created without a valid status" do
      products(:two)[:status] = nil

      products(:two).wont_be :valid?
    end

    it "product can not be created without valid stock" do
      products(:two)[:stock] = -1

      products(:two).must_be :invalid?
    end

    it "product can not be created without name" do
      products(:two)[:name] = nil

      products(:two).must_be :invalid?
    end

    it "product can not be created without valid price" do
      products(:two)[:price] = -2

      products(:two).must_be :invalid?
    end
  end

  describe "association test" do
    it "Product has one user" do
      assert_equal 1, products(:one).user_id
    end

    it "Product can have many reviews" do
      assert_operator 1, :<, products(:two).reviews.count
    end

    it "Product can have many product_orders" do
      #TODO: Not functioning
      assert_operator 1, :<, products(:one).product_orders.count
    end

    # it "Product can have many product_orders" do
    #   #TODO: Not functioning
    #   assert_operator 1, :<, products(:one).product_orders.count
    # end

  end
end
