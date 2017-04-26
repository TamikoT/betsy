require "test_helper"

describe ProductOrder do
  let(:product_order) { ProductOrder.new }

  it "must be valid" do
    product_orders.each do |product_order|
      value(product_order).must_be :valid?
    end
  end
  describe "validation tests" do
    it "quantity can not be string" do
      product_order[:quantity] = "String"
      product_order.save

      product_order.must_be :invalid?
    end

    it "quantity can not be 0" do
      product_order[:quantity] = 0
      product_order.save

      product_order.must_be :invalid?
    end
  end

  describe "association tests" do
    it "#product" do
      assert_equal 1, product_orders(:one).product_id
    end

    it "#order" do
      assert_equal 1, product_orders(:one).order_id
    end
  end
end
