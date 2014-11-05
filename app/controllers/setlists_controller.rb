class SetlistsController < ApplicationController
  before_action :set_setlist, only: [:show, :edit, :update, :destroy]

  def index
    @setlists = Setlist.all
  end

  def show
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
      params.require(:setlist).permit(:mbid, :name, :artist, :plays)
    end
end
