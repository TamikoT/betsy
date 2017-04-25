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
end

# it "new user can not be created without a username" do
#   user[:username] = nil
#   user.save
#
#   user.must_be :invalid?
# end

# it "saves the product" do
#   product = Product.new
#   assert !product.save
#   assert !product.errors[:name].empty?
# end
#
# it "must set the name" do
#   product = Product.new
#   assert_equal(user.name, "Audrey")
# end
#
#
# validates :status, presence: true
# validates :stock, presence: true
# validates :name, presence: true
# validates :price, presence: true
# validates :user_id, presence: true
