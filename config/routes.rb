Rails.application.routes.draw do |map|

  # to login you go to:
  # /auth/open_id
  # it is provided by omniauth rack middleware declared in initializers/omniauth.rb
  match "/auth/:provider/callback" => "JustOpenId::Sessions#create"
  match "/signout" => "JustOpenId::Sessions#destroy", :as => :signout

end
