class AddIndexToUsersEmail < ActiveRecord::Migration[5.0]
  def change
    add_indes :users, :email, Unique: true
  end
end
