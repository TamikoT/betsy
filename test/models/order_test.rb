require "test_helper"

describe Order do
  let(:order) { Order.new }

  it "all orders must be valid" do
    orders.each do |order|
      value(order).must_be :valid?
    end
  end

  # required test (1/1)
  it "has one or more productorders for a 'paid' order" do
  end

  describe "validation tests" do
    it  "new order can not be created without a status" do
      proc { order.save! }.must_raise ("An order must have a status.")
      order.errors.must_include(:status)
    end
    it "new order can be created with a status" do
      order[:status] = "complete"
      order.save

      order.must_be :valid?
    end
  end

  describe "associations test" do
    it "#product_orders - an order can have multiple product orders" do
      # skip
      assert_equal 2, orders(:one).product_orders.size
    end

    it "#user_orders" do
    end
  end
end


# describe "associations test" do
#   it "#product_categories - recognizes the correct number" do
#     assert_equal 2, categories(:one).product_categories.size
#   end
