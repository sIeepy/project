class PrimaryKey
  def initialize(database, user, table)
    @database = database
    @user = user
    @table = table
  end

  def primary_key
    ConnectDatabase.new(@database, @user).connection
    RemoteConnect.connection.primary_key(@table)
  end
end
