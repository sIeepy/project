class AddContent
  def initialize(database, user, content)
    @table_name = content[:table_name]
    @database = database
    @user = user
    split(content)
  end

  def split(content)
    c1 = []
    content.values.each { |k, v| c1 << k }
    c1.shift
    @value =  []
    c1[0].map { |k, v| @value << v }
  end

  def add
    ConnectDatabase.new(@database, @user).connection
    insert = "INSERT INTO #{@table_name} VALUES (#{@value.map(&:inspect).join(', ').gsub(/"/, "'")})"
    RemoteConnect.connection.execute(insert)
  end
end
