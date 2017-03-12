class CreateDatabases < ActiveRecord::Migration[5.0]
  def change
    create_table :databases do |t|
      t.string :db_name
      t.string :db_owner

      t.timestamps
    end
  end
end
