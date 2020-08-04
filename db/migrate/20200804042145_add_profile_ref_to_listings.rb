class AddProfileRefToListings < ActiveRecord::Migration[6.0]
  def change
    add_reference :listings, :profile, foreign_key: true
  end
end
