class UpdateStringTypeColumnToHstoreForShiaiCategories < ActiveRecord::Migration[5.1]
  def up
    remove_column :shiai_categories, :description, :text
    remove_column :shiai_categories, :title, :text
    add_column :shiai_categories, :description, :hstore
    add_column :shiai_categories, :title, :hstore
  end

  def down
    remove_column :shiai_categories, :description, :hstore
    remove_column :shiai_categories, :title, :hstore
    add_column :shiai_categories, :description, :text
    add_column :shiai_categories, :title, :text
  end
end
