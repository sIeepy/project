class DeleteTable
  def initialize(database, user, table)
    @table = table
    @database = database
    @user = user
  end

  def delete_table
    ConnectDatabase.new(@database, @user).connection
    delete = "ALTER TABLE #{@table}
                      SET SCHEMA trash;"
    RemoteConnect.connection.execute(delete)
  end
end
