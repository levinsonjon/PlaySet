class Setlist < ActiveRecord::Base
	belongs_to :request
	has_many :tracks
#	serialize :tracks
#	has_many :users, through: :requests
end
