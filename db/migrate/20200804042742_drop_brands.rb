class DropBrands < ActiveRecord::Migration[6.0]
  def up
    drop_table :categories
    drop_table :brands
  end
  
  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
