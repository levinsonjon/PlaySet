class Request < ActiveRecord::Base
#belongs_to :user
serialize :setlist_ids
has_many :setlists
end

