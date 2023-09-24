class ApplicationController < ActionController::Base

  private

    def user_logged_in?
      session[:user_id]
    end

    helper_method :user_logged_in?

    def requires_login
      redirect_to users_login_path unless session[:user_id]
    end
end
