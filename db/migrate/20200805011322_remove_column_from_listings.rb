class RemoveColumnFromListings < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :start_date
    remove_column :listings, :end_date
  end
end
