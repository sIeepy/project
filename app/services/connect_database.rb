class ConnectDatabase < ApplicationController

  def initialize(database, user)
    db_id = Database.find(database)
    user_id = User.find(user)
    @name ="d#{user_id.id}#{db_id.db_name}".underscore
  end

  class RemoteConnect < ActiveRecord::Base

    def self.abstract_class?
      true
    end
  end

  def connection
    @connect_p = {adapter: 'postgresql',
                  database: "#{@name}",
                  username: 'user',
                  password: 'user1',
                  host: 'localhost'}
  end
end

class Connection < ConnectDatabase
  def connect
    connect = RemoteConnect.establish_connection(@connect_p).connection
  end
end
