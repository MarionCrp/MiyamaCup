class AddEnableToShiaiCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :shiai_categories, :enabled, :boolean, default: false
  end
end
