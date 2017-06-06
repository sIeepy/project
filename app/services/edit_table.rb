class EditTable
  def initialize(database, user, table)
    @database = database
    @user = user
    @table_name = table[:table_name]
    @table_name_old = table[:old_t]
    split(table)
  end

  def split(table)
    c1 = []
    table.values.each { |k, v| c1 << k }
    c1.shift
    c1.shift
    c1.uniq! { |hash| hash['row'] }
    @col = c1.map { |h| h['row'].gsub(/^\d/, 'c') }
    @old_c = c1.map { |h| h['old_c'] }
    @delete = c1.map { |h| h['destroy'] }
  end

  def empty_c(fresh, old, delete)
    if delete == 1 || fresh == old || fresh.blank? || @old_c.include?(fresh)
      @fresh_a = []
    else
      @fresh_a = [fresh]
      @old_a = [old]
    end
  end


  def drop
    tog = @old_c.zip @delete
    @d_list = tog.reject { |o, d| d == '0' }
    unless @d_list.empty?
      @del = []
      @d_list.each do |i, j|
        @del << i
      end
    end
  end

  def drop_col
    ConnectDatabase.new(@database, @user).connection
    drop
    if @table_name != ''
      @d_list.size.times { |i| drop_com(@table_name, @del[i]) }
    else
      @d_list.size.times { |i| drop_com(@table_name_old, @del[i]) }
    end
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

  def column_name(table, col_n, col_o)
    col_name = "ALTER TABLE #{table} RENAME COLUMN #{col_o} TO #{col_n};"
    RemoteConnect.connection.execute(col_name)
  end

  def drop_com(table, col)
    drop = "ALTER TABLE #{table} DROP COLUMN IF EXISTS #{col} CASCADE"
    RemoteConnect.connection.execute(drop)
  end

  def rename_row
    ConnectDatabase.new(@database, @user).connection
    if @table_name != ''
      check_one(@table_name)
    else
      check_one(@table_name_old)
    end
  end

  def check_one(table)
    w = @col.zip(@old_c, @delete)
    w.each do |col, old_col, delete|
      empty_c(col, old_col, delete)
      unless @fresh_a.empty?
        @fresh_a.size.times do |i|
          column_name(table, @fresh_a[i], @old_a[i])
        end
      end
    end
  end
end
