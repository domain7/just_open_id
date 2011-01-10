#require 'openid/store/filesystem'
require 'openid/store/memcache'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :open_id, OpenID::Store::Memcache.new(Dalli::Client.new)
  # provider :open_id, ActiveRecordStore.new, :identifier => JustOpenId::Engine.config.openid_url
end


