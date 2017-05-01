require "test_helper"

describe SessionsController do
  describe "auth_callback" do
    describe "login" do

      it "succeeds for a returning user" do
        username = User.first.username
        post login_path, params: { username: username, email: "test@gmail.com" }
        must_redirect_to root_path
      end

      it "renders 400 bad_request if the username is not found" do
        post login_path, params: { username: "", email: "test1@gmail.com" }
        must_respond_with :bad_request
      end

    end

    describe "create" do

      it "succeeds for a new user" do
        skip

        username = "test_user"
        # Precondition: no user with this username exists
        User.find_by(username: username).must_be_nil

        post login_path, params: { username: username, email: "test@gmail.com" }
        must_redirect_to root_path
      end

    end

    describe "logout" do

      it "succeeds if the user is logged in" do
        # login(users(:grace))
        user = users(:grace)

        post login_path, params: user
        must_redirect_to root_path

        post logout_path
        must_redirect_to root_path
      end

      it "succeeds if the user is not logged in" do
        #Can this actually happen?
        post logout_path
        must_redirect_to root_path
      end

    end


    it "New session registers a new user" do
      start_count = User.count
      user = User.new(oauth_provider: "github", oauth_uid: 99999, username: "test_name", email: "test@aol.com")

      login(user) #T_T method in test_helper

      must_redirect_to root_path
      User.count.must_equal start_count + 1
      session[:user_id].must_equal User.last.id
    end

    it "Repeat session accepts a returning user" do
      start_count = User.count

      user = users(:grace)
      login(user)

      must_redirect_to root_path

      User.count.must_equal start_count
    end

    it "Rejects incomplete auth data" do
    end
  end
end
