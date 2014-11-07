class AddrequestTextToRequests2 < ActiveRecord::Migration
  def change
  	  	add_column :requests, :request_text,:string
  end
end
