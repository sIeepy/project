class CreateTable < ApplicationController
  def initialize(database, user, t_name, r1_name, d1)
    @d1 = d1
    @t_name = t_name
    @r1_name = r1_name
    @database = database
    @user = user
  end

  def new_table
    ConnectDatabase.new(@database, @user).connection
    create_table = "CREATE TABLE #{@t_name} (
                              #{@r1_name}     #{@d1});"
    RemoteConnect.connection.execute(create_table)
  end
end
