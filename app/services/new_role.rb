class NewRole

    def initialize(user_id)
      ur_id = User.find user_id
      @owner = ur_id.name
    end

    def create_role
      form = "CREATE ROLE #{@owner};"
      ActiveRecord::Base.connection.execute(form)
    end
end
