class SessionDatabaseController < ApplicationController
  def new
    @bases = Database.where(["db_owner = :db_owner",
                          { :db_owner => current_user.name }]).all
  end

end
