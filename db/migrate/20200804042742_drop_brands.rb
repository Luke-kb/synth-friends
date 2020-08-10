class DropBrands < ActiveRecord::Migration[6.0]
  def change
    drop_table :brands do |t|
      t.string :name
      t.timestamps 
    end
    drop_table :categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
