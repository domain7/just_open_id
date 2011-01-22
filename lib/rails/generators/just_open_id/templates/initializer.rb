module JustOpenId
  class Engine < Rails::Engine
    config.openid_url = 'www.myopenid.com/'
  end
end

require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :open_id, OmniAuth::Strategies::GoogleApps, OpenID::Store::Filesystem.new('./tmp'), :domain => 'foo.com'
end


