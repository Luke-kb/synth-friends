class AddAvailibilityColToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :availability, :boolean
  end
end
