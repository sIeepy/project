class AddContent_name
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
    value = c1.shift
    lol = []
    value.map { |k, v| lol << v }
    tog = lol.zip c1
    @val = tog.reject { |i, j| i.empty?}
  end

  def check_one
    if @val.empty?
      redirect_to new_content_path(table_name: @table_name)
    else
      c2 = []
      c3 = []
      @val.each do |j,k|
        c2 << j
        c3 << k
      end
      add_content(c3, c2)
    end
  end

  def add_content(name, content)
    insert = "INSERT INTO #{@table_name} (#{name.map(&:inspect).join(', ')}) VALUES (#{content.map(&:inspect).join(', ').gsub(/"/, "'")})"
    RemoteConnect.connection.execute(insert)
  end

  def add
    ConnectDatabase.new(@database, @user).connection
    check_one
  end
end
