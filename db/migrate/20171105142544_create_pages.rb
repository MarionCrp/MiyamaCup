class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :param
      t.hstore :title
      t.hstore :content
      t.integer :position
      t.boolean :visible, default: false
      t.references :cup

      t.timestamps
    end
  end
end
