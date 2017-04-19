require "test_helper"

describe ProductOrder do
  let(:product_order) { ProductOrder.new }

  it "must be valid" do
    value(product_order).must_be :valid?
  end
end
