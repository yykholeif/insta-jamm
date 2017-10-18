class CreateMusicianInstruments < ActiveRecord::Migration[5.0]
  def change
    create_table :musician_instruments do |t|
      t.integer :instrument_id,  :null => false
      t.integer :musician_id,  :null => false

      t.timestamps
    end
  end
end
