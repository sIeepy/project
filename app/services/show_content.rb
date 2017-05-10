class ShowContent
  def initialize(database, user, table)
    @database = database
    @user = user
    @table = table
  end

  def show_content
    ConnectDatabase.new(@database, @user).connection
    RemoteConnect.connection.execute("SELECT * FROM #{@table}")
  end
end
