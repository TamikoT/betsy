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
    end
  end
end
