class CreateDatabase

  def initialize(db_nm, ur_id, db_ur)
    @database = db_nm
    @user = ur_id
    @owner = db_ur
    @name ="d#{ur_id}#{db_nm}".underscore
  end

  def create_db
      check = "SELECT 1 FROM pg_database WHERE datname = '#{@name}'"
      result = ActiveRecord::Base.connection.exec_query(check)
    if result.present?
      return result
    else
      form =  "CREATE DATABASE #{@name} OWNER #{@owner};"
      ActiveRecord::Base.connection.execute(form)
    end
  end

  def create_schema
    ConnectDatabase.new(@database, @user).connection
    RemoteConnect.connection.execute("CREATE SCHEMA IF NOT EXISTS trash")
  end
end
