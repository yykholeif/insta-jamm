class CreateMusicians < ActiveRecord::Migration[5.0]
  def change
    create_table :musicians do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false
      t.string :password_hash, :null => false
      t.string :city, :null => false
      t.string :country, :null => false
      t.string :postcode, :null => false
      t.integer :years_experience
      # t.integer :instrument_id, :null => false

      t.timestamps
    end
  end
end
