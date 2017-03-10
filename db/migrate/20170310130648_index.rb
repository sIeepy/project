class Index < ActiveRecord::Migration[5.0]
  def change
    remove_index :databases, :columns_number
  end
end
