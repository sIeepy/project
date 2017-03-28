class NewRole

    def initialize(user_id)
      ur_id = User.find user_id
      @owner = ur_id.name
    end

    def chcek
     end

    def create_role
        form = "DO $$
                  BEGIN
                    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = '#{@owner}') THEN
                      CREATE ROLE #{@owner} CREATEDB;
                    END IF;
                  END
                $$;"

        ActiveRecord::Base.connection.execute(form)
    end
end
