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
    @col = c1.map { |h| h['row'] }
    @data = c1.map { |h| h['data'] }
    @old_c = c1.map { |h| h['old_r'] }
    @old_t = c1.map { |h| h['old_t'] }
  end

  def empty_c(fresh, old)
    tog = fresh.zip old
    @new_a = tog.reject { |f, o| f.blank? }
    unless @new_a.empty?
      @fresh_a = []
      @old_a = []
      @new_a.each do |f, o|
        @fresh_a << f
        @old_a << o
      end
    end
  end

  def empty_d(fresh, col)
    tog = fresh.zip col
    @new_d = tog.reject { |f, c| f.blank? }
    unless @new_d.empty?
      @fresh_d = []
      @col = []
      @new_d.each do |f, c|
        @fresh_d << f
        @col << c
      end
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

  def data_name(table, col, dat_n)
    dat_name = "ALTER TABLE #{table} ALTER COLUMN #{col} TYPE #{dat_n} USING (#{col}::#{dat_n})"
    RemoteConnect.connection.execute(dat_name)
  end

  def rename_row
    ConnectDatabase.new(@database, @user).connection
    if @table_name != ''
      check_one(@col, @old_c, @table_name)
      check_two(@data, @table_name)
    else
      check_one(@col, @old_c, @table_name_old)
      check_two(@data, @table_name_old)
    end
  end

  def check_one(fresh, old, table)
    empty_c(fresh, old)
    unless @new_a.empty?
      @new_a.size.times do |i|
        column_name(table, @fresh_a[i], @old_a[i])
      end
    end
  end

  def check_two(fresh, table)
    if @col.nil?
      empty_d(fresh, @old_c)
      unless @new_d.empty?
        @new_d.size.times do |i|
          data_name(table, @col[i], @fresh_d[i])
        end
      end
    else
      empty_d(fresh, @col)
      unless @new_d.empty?
        @new_d.size.times do |i|
          data_name(table, @col[i], @fresh_d[i])
        end
      end
    end
  end
end
