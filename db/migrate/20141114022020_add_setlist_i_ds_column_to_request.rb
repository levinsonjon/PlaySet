class AddSetlistIDsColumnToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :setlist_ids, :string
  end
end
