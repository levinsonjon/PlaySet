class ChangeFormatSetlistIDtoTracks < ActiveRecord::Migration
  		def up
    change_column :tracks, :setlist_id, :string
  end

  def down
    change_column :tracks, :setlist_id, :integer
	end
end
