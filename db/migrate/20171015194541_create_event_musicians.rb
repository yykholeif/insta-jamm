class CreateEventMusicians < ActiveRecord::Migration[5.0]
  def change
    create_table :event_musicians do |t|
      t.integer :event_id,  :null => false
      t.integer :musician_id,  :null => false

      t.timestamps
    end
  end
end
