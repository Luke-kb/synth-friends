class AddRenterIdToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :renter_id, :integer
  end
end
