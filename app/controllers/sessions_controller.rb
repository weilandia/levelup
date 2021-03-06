class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env['omniauth.auth'], current_user)
      flash[:notice] = "Welcome."
      session[:user_id] = user.id
    end
    redirect_to user_path(current_user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
