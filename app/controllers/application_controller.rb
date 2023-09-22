class ApplicationController < ActionController::Base

  private

    def user_logged_in?
      session[:user_id]
    end

    helper_method :user_logged_in?
end
