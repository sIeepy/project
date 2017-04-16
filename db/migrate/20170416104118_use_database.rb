class UseDatabase < ActiveRecord::Migration[5.0]
  def change
    create_table :database_name do |t|
      t.string :use_name

      t.timestamps
  end
end
