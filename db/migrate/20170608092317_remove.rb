class Remove < ActiveRecord::Migration[5.0]
  def change
    drop_table :add_columns
    drop_table :columns
  end
end
