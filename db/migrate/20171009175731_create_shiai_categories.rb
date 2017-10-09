class CreateShiaiCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :shiai_categories do |t|
      t.references :cup
      t.text :description
      t.string :title
      t.float :fees
      t.integer :gender
      t.boolean :team, default: false
      t.date :day
    end
  end
end
