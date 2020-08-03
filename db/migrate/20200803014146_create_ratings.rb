class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.string :comment
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
