class CreateTable < ApplicationController
  def initialize(database, user, table)
    @t_name = table[:table_name].gsub(/^\d/, 't')
    split(table)
    @database = database
    @user = user
  end

  def split(table)
    c1 = []
    table.values.each { |k, v| c1 << k }
    c1.shift
    col = c1.map { |h| h['row'].gsub(/\s+/, '_') }
    data = c1.map { |h| h['data'] }
    unique = c1.map { |h| h['unique'] }
    size = c1.map { |h| h['size'] }
    required = c1.map { |h| h['required'] }
    primary_key = c1.map { |h| h['primary_key'] }
    condition(col, data, unique, required, primary_key, size)
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

  def condition(col, data, unique, required, primary_key, size)
    @output = []
    row = col.zip(data, unique, required, primary_key, size)
    empty_check = row.reject {|c,d,u,r,pr,s| c.blank? }
    empty_check.each do |i|
      case
      when i[4] == '1'
        @output << "#{i[0]} #{c_size(i[1], i[5])} PRIMARY KEY,"
      when i[2] == '1' && i[3] == '1'
        @output << "#{i[0]} #{c_size(i[1], i[5])} NOT NULL UNIQUE,"
      when i[2] == '1' && i[3] == '0'
        @output << "#{i[0]} #{c_size(i[1], i[5])} NULL UNIQUE,"
      when i[2] == '0' && i[3] == '1'
        @output << "#{i[0]} #{c_size(i[1], i[5])} NOT NULL,"
      when i[2] == '0' && i[3] == '0'
        @output << "#{i[0]} #{c_size(i[1], i[5])},"
      when i[4] == '0' && i[2]== '0' && i[3] == '0'
        @output << "#{i[0]} #{c_size(i[1], i[5])},"
      end
    end
  end

  def new_table
    ConnectDatabase.new(@database, @user).connection
    create_table = "CREATE TABLE IF NOT EXISTS #{@t_name} (#{@output.join(' ').gsub(/,$/, '')});"
    RemoteConnect.connection.execute(create_table)
  end
end
