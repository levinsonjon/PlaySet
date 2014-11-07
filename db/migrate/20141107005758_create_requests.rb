class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :setlist
      t.integer :user
      t.integer :request_count

      t.timestamps
    end
  end
end
