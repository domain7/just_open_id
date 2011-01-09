# require 'omniauth/openid'
# require 'openid/store/filesystem'
# 
# use Rack::Session::Cookie
# use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new('/tmp')

require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :open_id, OpenID::Store::Filesystem.new('/tmp'), :identifier => JustOpenId::Engine.config.openid_url
end