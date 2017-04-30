class ShowTables
  def initialize(database, user)
    @database = database
    @user = user
  end

  def show_tables
    ConnectDatabase.new(@database, @user).connection
    RemoteConnect.connection.tables
  end
end
