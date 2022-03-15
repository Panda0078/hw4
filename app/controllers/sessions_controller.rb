class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ email: params["email"] })
      if @user
        if BCrypt::Password.new(@user.password) == params["password"]
          session[:user_id] = @user.id
          flash[:notice] = "Welcome you are now logged in, #{@user.username}!"
          redirect_to "/places"
        else
          flash[:notice] = "Incorrect password."
          redirect_to "/sessions/new"
        end
        
      else 
          flash[:notice] = "Email is not registered, Please sign up"
          redirect_to "/sessions/new"
      end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to "/sessions/new"
  end
end
  