class StaticPagesController < ApplicationController

	def home
	end

	def go
		link_to 'Show', Setlist.name
	end

end