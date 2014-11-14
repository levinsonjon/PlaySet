class AddTracksColumnToSetlist < ActiveRecord::Migration
  def change
    add_column :setlists, :tracks, :string
  end
end
