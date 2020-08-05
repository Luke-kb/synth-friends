class RemoveColFromListings < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :short_description
  end
end
