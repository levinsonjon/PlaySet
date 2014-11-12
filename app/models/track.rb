class Track < ActiveRecord::Base
	belongs_to :request

	validates :name  => true
end
