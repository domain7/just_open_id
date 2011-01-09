require 'rails/generators'
require 'rails/generators/migration'

class JustOpenIdGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    File.join(File.dirname(__FILE__), 'templates')
  end
   
  def self.next_migration_number(dirname) #:nodoc:
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end


  # Every method that is declared below will be automatically executed when the generator is run
  
  def create_migration_file
    f = File.open File.join(File.dirname(__FILE__), 'templates', 'schema.rb')
    schema = f.read; f.close
    
    schema.gsub!(/ActiveRecord::Schema.*\n/, '')
    schema.gsub!(/^end\n*$/, '')

    f = File.open File.join(File.dirname(__FILE__), 'templates', 'migration.rb')
    migration = f.read; f.close
    migration.gsub!(/SCHEMA_AUTO_INSERTED_HERE/, schema)
    
    tmp = File.open "tmp/~migration_ready.rb", "w"
    tmp.write migration
    tmp.close

    migration_template  '../../../tmp/~migration_ready.rb',
                        'db/migrate/create_just_open_id_tables.rb'
    remove_file 'tmp/~migration_ready.rb'
  end

  def copy_initializer_file
    copy_file 'initializer.rb', 'config/initializers/just_open_id.rb'
  end

  def add_user_model
    create_file 'app/models/user.rb' do
      "class User < JustOpenId::User\nend"
    end
  end
  
  def welcome
    puts '1. Run your migrations for your namespaced User model.
2. Ensure you have a root path.
3. Add this to a template.

<% if current_user %>
  Welcome <%= current_user.name %>!
  <%= link_to "Sign Out", signout_path %>
<% else %>
  <%= link_to "Sign in with Twitter", "/auth/twitter" %>
<% end %>'
  end
  
end
