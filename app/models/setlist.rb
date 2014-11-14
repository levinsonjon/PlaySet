class Setlist < ActiveRecord::Base
	serialize :tracks
	belongs_to :requests
#	has_many :users, through: :requests
end
