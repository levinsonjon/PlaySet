class SetlistsController < ApplicationController
  before_action :set_setlist, only: [:show, :edit, :update, :destroy, :nilshow]

  def index
     @setlists = Setlist.all
  end

  def show
    puts "***********"
    puts @setlist.tracks.class
    puts @setlist.tracks.empty?
    puts "************"
    unless @setlist.tracks.empty?
      @setlist = Setlist.find(params[:id])
    else
      flash[:notice] = "Ooops! Seems like there are no posted tracks in this setlist!
If you would like to add one, help Setlist.fm out here! #{@setlist.url_id}"
    end
  end

  def new
    @setlist = Setlist.new
  end

  def edit
  end

  def create
    @setlist = Setlist.new(setlist_params)
     if @setlist.save
       redirect_to @setlist 
    else
      render :new
      flash[:error] = "The setlist failed to save."
    end
  end

  def update
    @setlist.update(setlist_params)
  end

  def destroy
    @setlist.destroy
  end

  private
    def set_setlist
      @setlist = Setlist.find(params[:id])
    end

    def setlist_params
      params.require(:setlist).permit(:tracks, :mbid, :name, :artist, :plays, :request_id)
    end
end
