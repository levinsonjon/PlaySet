class AddUrlColumnToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :URL, :string
  end
end
