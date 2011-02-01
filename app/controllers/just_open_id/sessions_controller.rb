module JustOpenId
  class SessionsController < ApplicationController
    skip_before_filter :require_user, :only => [:create]

    unloadable
    
    def create
      auth = request.env["omniauth.auth"]
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
      session[:user_id] = user.id
      path = session.has_key?(:return_to) ? session[:return_to] : root_url
      redirect_to path, :notice => "Signed in!"
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_url, :notice => "Signed out!"
    end
    
  end
end

