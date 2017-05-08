class EditTable
  def initialize(database, user, table)
    @database = database
    @user = user
    @table_name = table[:table_name]
    @table_name_old = table[:old_t]
    split(table)
    binding.pry
  end

  def split(table)
    c1 = []
    table.values.each { |k, v| c1 << k }
    c1.shift
    c1.shift
    @row = c1.map { |h| h['row'] }
    @data = c1.map { |h| h['data'] }
    @old_r = c1.map { |h| h['old_r'] }
    @old_t = c1.map { |h| h['old_t'] }
  end
  def rename_table
    ConnectDatabase.new(@database, @user).connection
    if @table_name == ''
      return @table_name_old
    else
      rename_t = "ALTER TABLE #{@table_name_old}
                    RENAME TO #{@table_name}"
      RemoteConnect.connection.execute(rename_t)
      return @table_name
    end
  end

  def rename_row
    ConnectDatabase.new(@database, @user).connection
    if @table_name == ''
    else
      rename_t = "ALTER TABLE distributors RENAME COLUMN address TO city;"
      RemoteConnect.connection.execute(rename_t)
    end
  end
end
