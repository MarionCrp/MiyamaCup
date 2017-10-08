class CreateCups < ActiveRecord::Migration[5.1]
  def change
    create_table :cups do |t|
      t.string :title
      t.date :start_at
      t.date :end_at
      t.string :address
      t.text :description
    end
  end
end
