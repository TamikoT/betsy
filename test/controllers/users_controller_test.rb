require 'test_helper'

describe UsersController do
  describe "index" do
    it "responds with no users" do
      User.destroy_all

      get users_path
      must_respond_with :success
    end

    # TODO must create fixtures with many users
    it "responds with multiple users" do
    skip
      User.count.must_be :>, 0

      get users_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "responds with an existing user" do
    skip
      get user_path(User.first)
      must_respond_with :success
    end

    it "404 with invalid user data" do
    skip
      bogus_user_id = User.last.id + 1
      get user_path(bogus_user_id)
      must_respond_with :not_found
    end
  end
end
