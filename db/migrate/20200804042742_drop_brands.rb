class DropBrands < ActiveRecord::Migration[6.0]
  def change
    drop_table :brands
    drop_table :categories
  end
end
