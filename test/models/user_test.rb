require "test_helper"

describe User do
  let(:user) { User.new }

  it "must be valid" do
    users.each do |user|
      value(user).must_be :valid?
    end
  end

  it "saves the user" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  it "must set the name" do
    user = User.new "Audrey"
    assert_equal(user.name, "Audrey")
  end

  it "creates the new user" do
   @user.name = "Freddie Mac"
   assert_not @user.valid?
  end


end
