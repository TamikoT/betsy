require "test_helper"

describe Category do
  let(:category) { Category.new }

  it "all categories must be valid" do
    categories.each do |category|
      value(category).must_be :valid?
    end
  end

  it "will not create new category without unique name" do
    category_copy = category.dup
    proc { category_copy.save! }.must_raise("Category name must be unique.")
    category_copy.errors.must_include(:name)
  end
end

# it 'must have unique pin' do
#   person_copy = person.dup
#   proc { person_copy.save! }.must_raise(Mongoid::Errors::Validations)
#   person_copy.errors.must_include(:pin)
# end
