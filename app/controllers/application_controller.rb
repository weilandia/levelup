class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize!
  helper_method :current_user

  def authorize!
    unless authorized?
      redirect_to root_path
    end
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorized?
      current_permission.allow?
    end

    def current_permission
      @current_permission ||= Permission.new(current_user, params[:controller], params[:action])
    end
end
