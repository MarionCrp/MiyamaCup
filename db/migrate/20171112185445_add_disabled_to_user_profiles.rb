class AddDisabledToUserProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :user_profiles, :disabled, :boolean, default: false
  end
end
