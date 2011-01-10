require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  # options = {}
  # options[:identifier] = JustOpenId::Engine.config.openid_url if JustOpenId::Engine.config.openid_url
  provider :open_id, OpenID::Store::Filesystem.new('./tmp')
end


