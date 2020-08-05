class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :listings, :long_description, :description
  end
end
