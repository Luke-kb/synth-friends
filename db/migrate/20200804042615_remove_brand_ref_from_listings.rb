class RemoveBrandRefFromListings < ActiveRecord::Migration[6.0]
  def change
    remove_reference :listings, :brand, foreign_key: true
    remove_reference :listings, :category, foreign_key: true
  end
end
