class AddSetlistIDtoTracks < ActiveRecord::Migration
  def change
  	 add_column :tracks, :setlist_id, :integer
  end
end
