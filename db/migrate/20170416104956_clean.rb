class Clean < ActiveRecord::Migration[5.0]
  def change
    drop_table :database_name
  end
end
