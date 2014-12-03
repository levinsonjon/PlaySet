class TracksController < ApplicationController
require 'rest_client'

  def index
  	@tracks = Track.all
  end

  def show
  @track = Track.find(params[:id])

  # @response = RestClient.get "https://api.spotify.com/v1/search?q=#{@track.name}&type=track"
  # @response = JSON.parse @response
  # @spotifyURL = ""
  # @responsebool = 0
  # until @responsebool = 1
  #   @response['tracks']['items'][0]['artists'][0]

  end

  def new
    @track = Track.new
  end

  def edit
  end

  def create
   @track = Track.new(:name)
  end

  def update
    @Track.update(track_params)
  end

  def destroy
    @track.destroy
  end

  private
    def track_request
      @track = Track.find(params[:name])
    end

    def track_params
      params.require(:name)
    end
end
