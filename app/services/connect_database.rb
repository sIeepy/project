class ConnectDatabase < ApplicationController
  def initialize(database, user)
    @database = database
    @user = user
  end

  def name
    @name = "d#{@user}#{@database}".underscore
  end

  def connection
    connection = RemoteConnect.establish_connection(
                adapter: 'postgresql',
                database: "#{name}",
                username: 'user',
                password: 'user1',
                host: 'localhost').connection
    end
end
class RemoteConnect < ActiveRecord::Base
  def self.abstract_class?
    true
  end
end
