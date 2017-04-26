require "test_helper"

describe UserOrder do
  let(:user_order) { UserOrder.new }

  it "must be valid" do
    user_orders.each do |user_order|
      value(user_order).must_be :valid?
    end
  end

  describe "association test" do
  end
end
