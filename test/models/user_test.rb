require "test_helper"

describe User do
  let(:user) { User.new }

  it "all users must be be valid" do
    users.each do |user|
      value(user).must_be :valid?
    end
  end

  it "does not save an invalid user" do
    user.wont_be :valid?
  end

  describe "validation tests" do
    it "new user can not be created without a username" do
      user[:username] = nil
      user.save

      user.must_be :invalid?
    end

    it "new user can not be created without a email" do
      user[:email] = nil

      user.must_be :invalid? #assert user.invalid?
    end

    it "new user can be created with valid username and email" do
      user[:username] = "unique_name"
      user[:email] = "unique_name@xxxxxx.com"

      user.must_be :valid?
    end
  end

  describe "associations test" do
    it "#products" do
      assert_equal 2, users(:user1).products.size
    end

    it "#user_orders" do
      assert_equal 2, users(:user1).user_orders.size
    end

    it "#orders, (through #user_products)" do
      assert_equal 2, users(:user1).orders.size
    end

    it "#reviews" do
      assert_equal 2, users(:user1).reviews.size
    end
  end

  #TODO: self.from_github test
end




# reviews.each do |review|
#   value(review).must_be :valid?
# end
