class AddtrackIDtoSetlists < ActiveRecord::Migration
   def change
  	 add_column :setlists, :track_id, :integer
  end
end
