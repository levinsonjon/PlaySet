class AddArtistColumnToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :artist, :string
  end
end
