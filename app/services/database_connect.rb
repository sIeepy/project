class DatabaseConnect < ApplicationController
  def initialize(db_id)
    db_n = Database.find db_id
    @name = db_n.db_name
  end

  def call
    ActiveRecord::Base.establish_connection(
        :adapter  => "postgresql",
        :host     => "localhost",
        #:username => "myuser",
        :password => "password1",
        :database => "#{@name}",
      )
  end
end
