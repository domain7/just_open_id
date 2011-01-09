ActiveRecord::Schema.define(:version => 0) do

    create_table :just_open_id_users, :force => true do |t|
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps
    end

end