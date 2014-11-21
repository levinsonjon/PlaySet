class ChangeSetlistidFormatInRequests < ActiveRecord::Migration
  	def up
    change_column :requests, :setlist_ids, :integer
  end

  def down
    change_column :requests, :setlist_ids, :string
	end
end

