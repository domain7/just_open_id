Rails.application.routes.draw do |map|

  # to login you go to:
  # /auth/google_apps
  # it is provided by omniauth rack middleware declared in initializers/omniauth.rb
  match "/auth/:provider/callback" => "JustOpenId::Sessions#create"
  match "/signout" => "JustOpenId::Sessions#destroy", :as => :signout
  match "/signin" => "JustOpenId::Sessions#new", :as => :signin

end
