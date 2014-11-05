class SetlistsController < ApplicationController
  before_action :set_setlist, only: [:show, :edit, :update, :destroy]

  def index
    @setlists = Setlist.all
    respond_with(@setlists)
  end

  def show
    respond_with(@setlist)
  end

  def new
    @setlist = Setlist.new
    respond_with(@setlist)
  end

  def edit
  end

  def create
    @setlist = Setlist.new(setlist_params)
    @setlist.save
    respond_with(@setlist)
  end

  def update
    @setlist.update(setlist_params)
    respond_with(@setlist)
  end

  def destroy
    @setlist.destroy
    respond_with(@setlist)
  end

  private
    def set_setlist
      @setlist = Setlist.find(params[:id])
    end

    def setlist_params
      params.require(:setlist).permit(:mbid, :name, :artist, :plays)
    end
end
