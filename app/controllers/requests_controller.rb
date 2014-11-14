class RequestsController < ApplicationController
  require 'rest_client'
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  def index
    @requests = Request.all
  end

  def show
    @request = Request.self
  end

  def new
    @request = Request.new
  end

  def edit
  end

  def create
    @request = Request.new(request_params)
    @artist = :artist
    @response = RestClient.get "http://api.setlist.fm/rest/0.1/search/setlists.json?artistName=#{@artist}"
    puts @response
    # Setlist.create(@response ("#{url}") => params[:setlist][:url])  
     if @request.save
       redirect_to @request
    else
      render :new
      flash[:error] = "Invalid request"
    end
  end


    #@setlist = result.first
    #if true
    #@setlist = setlist.save
  #     if user_signed_in?
  #       @request = current_user.requests.build(request_params)
  #       @request.setlist = @mbid
  #       @request.user = current_user
  #       @request_count = 0
  #     else
  #       @request = Request.new(request_params)
  #       @request.user_id = -1
  #       @request_count = 0
  #     end
  #   @request.setlist_id = @setlist_id
  #   @request.save
  # end

  def update
    @request.update(request_params)
  end

  def destroy
    @request.destroy
  end

  private
    # def set_request
    #   @request = Request.find(params[:id])
    # end

    def request_params
      params.require(:request).permit(:artist)
     
    end

    # def request
    # @request.show
    # end

end
