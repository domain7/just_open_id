module JustOpenId
  class SessionsController < ApplicationController

    unloadable
    
    layout 'just_open_id'  # this allows you to have a gem-wide layout
    
    def create
      auth = request.env["omniauth.auth"]
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Signed in!"
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_url, :notice => "Signed out!"
    end
    
  end
end

