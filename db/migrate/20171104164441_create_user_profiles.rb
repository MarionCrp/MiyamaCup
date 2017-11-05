class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.references :user, index: true
      t.references :admin, index: true
      t.boolean :is_main_profile, default: false
      t.integer :gender
      t.integer :grade
      t.string :club
      t.timestamps
    end
  end
end
