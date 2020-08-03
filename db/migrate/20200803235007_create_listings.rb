class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :short_description
      t.text :long_description
      t.decimal :price
      t.integer :year_of_manufacture
      t.datetime :start_date
      t.datetime :end_date
      t.references :category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
