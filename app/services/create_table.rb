class CreateTable < ApplicationController
  def initialize(database, user, table)
    @t_name = table[:table_name]
    split(table)
    @database = database
    @user = user
    @output = @row.zip @data
    @c2 = []
    @output.each { |x, y| @c2 << "#{x} #{y}" }
  end

  def split(table)
    c1 = []
    table.values.each { |k, v| c1 << k }
    c1.shift
    @row = c1.map { |h| h['row'] }
    @data = c1.map { |h| h['data'] }
  end

  def new_table
    ConnectDatabase.new(@database, @user).connection
    create_table = "CREATE TABLE #{@t_name} (#{@c2.join(', ')});"
    RemoteConnect.connection.execute(create_table)
  end
end
