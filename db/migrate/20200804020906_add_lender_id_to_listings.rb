class AddLenderIdToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :lender_id, :integer
  end
end
