class UpdateStringTypeColumnToHstore < ActiveRecord::Migration[5.1]
  def up
    remove_column :cups, :description, :text
    remove_column :cups, :title, :text
    add_column :cups, :description, :hstore
    add_column :cups, :title, :hstore
  end

  def down
    remove_column :cups, :description, :hstore
    remove_column :cups, :title, :hstore
    add_column :cups, :description, :text
    add_column :cups, :title, :text
  end
end
