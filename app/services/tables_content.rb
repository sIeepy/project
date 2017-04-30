class TablesContent
  def initialize(database, user, table)
    @database = database
    @user = user
    @table = table
  end

  def tables_content
    ConnectDatabase.new(@database, @user).connection
    RemoteConnect.connection.columns(@table)
  end
end
