module JustOpenId
  class User < ActiveRecord::Base
    set_table_name "just_open_id_users"

    def self.create_with_omniauth(auth)
      create! do |user|
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.name = auth["user_info"]["name"]
        user.email = auth["user_info"]["email"]
      end
    end
    
  end
end