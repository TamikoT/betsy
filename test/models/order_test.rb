require "test_helper"

describe Order do
  let(:order) { Order.new }

  it "all orders must be valid" do
    orders.each do |order|
      value(order).must_be :valid?
    end
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
end
