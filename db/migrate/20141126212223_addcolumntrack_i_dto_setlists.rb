class AddcolumntrackIDtoSetlists < ActiveRecord::Migration
    def change
  	 add_column :setlists, :track_id, :integer
  end
 def change
  	remove_column :setlists, :tracks
  end
end
