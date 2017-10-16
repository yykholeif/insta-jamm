class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, :null => false
      t.string :type, :null => false
      t.datetime :datetime, :null => false
      t.boolean :host

      t.timestamps
    end
  end
end
