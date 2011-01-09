require 'just_open_id'
require 'rails'
require 'action_controller'

module JustOpenId
  class Engine < Rails::Engine
    
    config.openid_url = 'www.myopenid.com/'
    
  end
end
