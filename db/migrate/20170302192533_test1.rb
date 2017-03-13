class Test1 < ActiveRecord::Migration[5.0]
  def down
    Product.delete_all
  end
end
