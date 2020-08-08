class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.references :listing, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :total_cost

      t.timestamps
    end
  end
end
