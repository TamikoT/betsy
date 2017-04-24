require "test_helper"

describe Category do
  let(:category) { Category.new }

  it "all categories must be valid" do
    categories.each do |category|
      value(category).must_be :valid?
    end
  end

  describe "validation tests" do
    it "new category can not be created a without unique name" do
      proc { category.save! }.must_raise("Category name must be unique.")
      category.errors.must_include(:name)
    end

    it "new category can be created with a unique name" do
      # TODO: Add fixture
      category[:name] = "unique"
      category.save

      category.must_be :valid?
    end
  end

  describe "association test" do
    it "#product_categories - a category can have multiple product categories" do
      assert_equal 2, categories(:one).product_categories.size
    end

    it "#products - a category can have multiple products" do
      skip
      # FIXME: Might be fixtures or the way I am calling it, not sure.
      assert_equal 2, categories(:one).product_categories.products.size
    end
  end
end
