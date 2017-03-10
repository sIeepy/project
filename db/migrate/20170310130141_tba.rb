class Tba < ActiveRecord::Migration[5.0]
  def change
    add_column :databases, :columns_number, :integer
    add_index :databases, :columns_number
  end
end
