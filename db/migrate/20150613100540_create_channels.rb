class CreateChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :channels do |t|
      t.string :name, :null => false
      t.string :callsign, :null => false
      t.decimal :price_per_month, :null => false

      t.timestamps
    end
  end
end
