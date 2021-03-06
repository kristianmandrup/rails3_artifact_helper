require 'migration_assist'

Rails::Migration::Assist.rails_root_dir = Rails::Assist::App.rails_root_dir

module Rails::Assist::Artifact
  module Migration
    include Rails::Assist::BaseHelper    
    include Rails::Migration::Assist::ClassMethods
  end
end