class Drop < ActiveRecord::Migration[5.0]
  def up
      drop_table :tests
      drop_table :databases
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
end
