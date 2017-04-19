require "test_helper"

describe UserOrder do
  let(:user_order) { UserOrder.new }

  it "must be valid" do
    value(user_order).must_be :valid?
  end
end
