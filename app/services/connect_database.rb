class ConnectDatabase < ApplicationController

  def initialize(database, user)
    @ur_id = user
    @db_id = database
    @name ="d#{@ur_id}#{@db_id}".underscore
  end

  class RemoteConnect < ActiveRecord::Base

    def self.abstract_class?
      true
    end
  end

  def connection
    connection = RemoteConnect.establish_connection({
                :adapter => 'postgresql',
                :database => "#{@name}",
                :username => 'user',
                :password => 'user1',
                :host => 'localhost'}).connection
  end
end
