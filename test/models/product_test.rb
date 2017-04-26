require "test_helper"

describe Product do
  let(:product) { Product.new }

  it "all products must be valid" do
    value(product).must_be :valid?
  end

  it "saves the product" do
    product = Product.new
    assert !product.save
    assert !product.errors[:name].empty?
  end

  it "must set the name" do
    product = Product.new
    assert_equal(user.name, "Audrey")
  end

end
