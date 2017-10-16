class CreateMusicians < ActiveRecord::Migration[5.0]
  def change
    create_table :musicians do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false
      t.string :password_hash, :null => false
      t.string :latitude, :null => false
      t.string :longitude, :null => false
      t.integer :years_experience

      t.timestamps
    end
  end
end
