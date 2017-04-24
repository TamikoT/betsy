require "test_helper"

#TODO: Need to update to so the tests utlize fixtures.

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

  it "will create a new category with a unique name" do
    category[:name] = "unique"
    category.save

    category.wont_be_nil
  end
end

# it 'must have unique pin' do
#   person_copy = person.dup
#   proc { person_copy.save! }.must_raise(Mongoid::Errors::Validations)
#   person_copy.errors.must_include(:pin)
# end
