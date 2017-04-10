class DatabaseConnect < ApplicationController

  def initialize(database_id, id)
    db_id = Database.find(database_id)
    user_id = User.find(id)
    @owner = db_id.db_owner
    @name ="d#{user_id.id}#{db_id.db_name}".underscore
  end

  def call
    require 'yaml'
    d = YAML::load_file("#{Rails.root}/config/database.yml") #Load
    d['user_base']['database'] = "#{@name}"
    d['user_base']['username'] = "#{@owner}"
    File.open("#{Rails.root}/config/database.yml", 'w') {|f| f.write d.to_yaml } #Store
  end
end
