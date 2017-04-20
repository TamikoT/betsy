class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :find_user

    private

    def find_user
        @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def require_login
        find_user
        if @current_user.nil?
            flash[:result_text] = 'You must be logged in to do that!'
            redirect_to root_path
        end
    end
end
