class AddDescriptionToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :bio, :text
  end
end
