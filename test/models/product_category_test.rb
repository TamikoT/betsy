require "test_helper"

describe ProductCategory do
  let(:product_category) { ProductCategory.new }

  it "must be valid" do
    product_categories.each do |product_category|
      value(product_category).must_be :valid?
    end
  end
end
