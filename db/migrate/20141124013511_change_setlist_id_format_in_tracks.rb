class ChangeSetlistIdFormatInTracks < ActiveRecord::Migration
  	def up
    change_column :tracks, :setlist_id, :integer
  end

  def down
    change_column :tracks, :setlist_id, :string
	end
 end
