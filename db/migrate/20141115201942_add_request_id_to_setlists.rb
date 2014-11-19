class AddRequestIdToSetlists < ActiveRecord::Migration
  def change
    add_column :setlists, :request_id, :string
  end
end
