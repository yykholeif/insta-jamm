class CreateMusicianships < ActiveRecord::Migration[5.0]
  def change
    create_table :musicianships do |t|
      t.references :musician
      t.references :instrument

      t.timestamps
    end
  end
end
