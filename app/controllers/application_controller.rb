class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private
  
    def logged_in_user
      return if logged_in?
      
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to root_url
    end
end
