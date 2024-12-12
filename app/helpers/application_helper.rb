module ApplicationHelper
    def user_signed_in?
      session[:user_id].present?
    end
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if user_signed_in?
    end
  end
  