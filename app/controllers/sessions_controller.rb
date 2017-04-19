class SessionsController < ApplicationController
    def new; end

    def create
        auth_hash = request.env['omniauth.auth']

        user = if auth_hash['uid']
                   User.find_by(oauth_provider: params[:provider], oauth_uid: auth_hash['uid'])
               else
                   User.find_by(name: params[:name])
               end

        if user
            session[:user_id] = user.id
            flash[:success] = "#{user.name} has loged in"
            redirect_to root_path
        else
            flash[:failure] = 'Login Failed'
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:logout] = "You're loged out"
        redirect_to root_path
    end
end
