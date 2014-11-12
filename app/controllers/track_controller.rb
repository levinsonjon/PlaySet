class TrackController < ApplicationController
  def index
  	@tracks = Track.all
  end

  def show
  	@tracks = Track.request
  end

  def new
    @track = Track.new
  end

  def edit
  end

  def create
   @track = Track.new(track_params)
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