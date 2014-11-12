class Request < ActiveRecord::Base
has_many :tracks
belongs_to :user
belongs_to :setlist


validates :eventDate, :id, :artist, :venue, :url => true
end

