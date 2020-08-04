class RemoveBuyerIdFromListings < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :buyer_id, :integer
  end
end
