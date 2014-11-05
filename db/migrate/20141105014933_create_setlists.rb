class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.string :mbid
      t.string :name
      t.string :artist
      t.integer :plays

      t.timestamps
    end
  end
end
