class AddColumn

  def initialize(database, user, table)
    @t_name = table[:table_name]
    split(table)
    @database = database
    @user = user
  end

  def column_size(data, size)
    if size == '' && (data == 'varchar' || data == 'char')
      "#{data}(50)"
    elsif size != '' && (data == 'varchar' || data == 'char')
      "#{data}(#{size})"
    elsif data != 'varchar' && data != 'char'
      data.to_s
    end
  end

  def col_name(col)
    col.gsub(/^\d/, 't')
    col.gsub(' ', '_')
  end

  def col_uniq
    c1 = []
    lel = TablesContent.new(@database, @user, @t_name).tables_content
    lel.each { |i| c1 << i.name.to_s }
    c1.include? @row_name
  end

  def split(table)
    c1 = []
    table.values.each { |i| c1 << i }
    c1.shift
    @row_name = c1[0]
    if c1[1] == '1' && c1[2] == '1'
      @output = "#{col_name(c1[0])} #{column_size(c1[3], c1[4])}
                  NOT NULL UNIQUE"
    elsif c1[1] == '0' && c1[2] == '1'
      @output = "#{col_name(c1[0])} #{column_size(c1[3], c1[4])} NULL UNIQUE"
    elsif c1[1] == '1' && c1[2] == '0'
      @output = "#{col_name(c1[0])} #{column_size(c1[3], c1[4])} NOT NULL"
    elsif c1[2] == '0' && c1[1] == '0'
      @output = "#{col_name(c1[0])} #{column_size(c1[3], c1[4])}"
    end
  end

  def add_column
    if col_uniq == false
      ConnectDatabase.new(@database, @user).connection
      create_table = "ALTER TABLE #{@t_name} ADD #{@output};"
      RemoteConnect.connection.execute(create_table)
    end
  end
end
