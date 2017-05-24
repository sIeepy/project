class AddColumn
  def initialize(database, user, table)
    @t_name = table[:table_name]
    split(table)
    @database = database
    @user = user
  end

  def c_size(data, size)
    if size == '' && (data == 'varchar' || data == 'char')
      return "#{data}(50)"
    elsif size != '' && (data == 'varchar' || data == 'char')
      return "#{data}(#{size})"
    elsif data != 'varchar' && data != 'char'
      return "#{data}"
    end
  end

  def col_name(col)
    col.gsub(/^\d/, 't')
    col.gsub(' ', '_')
  end

  def col_uniq
    c1 = []
    lel = TablesContent.new(@database, @user, @t_name).tables_content
    lel.each {|i| c1 << i.name.to_s}
    return c1.include? @row_name
  end

  def split(table)
    c1 = []
    table.map {|k,v| c1 << v}
    c1.shift
    @row_name = c1[0]
      case
      when c1[3] == '1'
        @output = "#{col_name(c1[0])} #{c_size(c1[4], c1[5])} PRIMARY KEY"
      when c1[2] == '1' && c1[1] == '1'
        @output = "#{col_name(c1[0])} #{c_size(c1[4], c1[5])} NOT NULL UNIQUE"
      when c1[2] == '1' && c1[1] == '0'
        @output = "#{col_name(c1[0])} #{c_size(c1[4], c1[5])} NULL UNIQUE"
      when c1[2] == '0' && c1[1] == '1'
        @output = "#{col_name(c1[0])} #{c_size(c1[4], c1[5])} NOT NULL"
      when c1[2] == '0' && c1[1] == '0'
        @output = "#{col_name(c1[0])} #{c_size(c1[4], c1[5])}"
      when c1[3] == '0' && c1[2]== '0' && c1[1] == '0'
        @output = "#{col_name(c1[0])} #{c_size(c1[4], c1[5])}"
      end
  end

  def add_column
    if col_uniq == false
      ConnectDatabase.new(@database, @user).connection
      create_table = "ALTER TABLE #{@t_name} ADD #{@output};"
      RemoteConnect.connection.execute(create_table)
    else
    end
  end
end
