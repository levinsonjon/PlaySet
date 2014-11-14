class AddUrlColumnToSetlist < ActiveRecord::Migration
  def change
    add_column :setlists, :URL, :string
  end
end
