class SessionsController < ApplicationController
    skip_before_action :logged_in_user, only: [:new, :create]

    def new
        # @user = User.new
    end

    def create
        if @user = User.find_by(name: params[:user][:name])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def destroy
        User.find(session[:user_id]).destroy
        session[:user_id] = nil
        redirect_to root_path
        
        # Another way to do it:
        # session.delete("user_id")
        # redirect+to root_path
    end
end