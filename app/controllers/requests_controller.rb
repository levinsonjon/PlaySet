class RequestsController < ApplicationController
  require 'rest_client'
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  ArtistName = ""
  date = ""
  venueName = ""
  cityName = ""
  API_BASE_URL = "http://api.setlist.fm"

  def index
    @requests = Request.all
  end

  def show
  end

  def new
    @request = Request.new
  end

  def edit
  end

  def create
    @request = Request.new(request_params)
    uri = "#{API_BASE_URL}"/rest/0.1/search/setlists.json
    rest_resource = RestClient::Resource.new(uri, ArtistName)
    @setlists = rest_resource.get
    @setlists = JSON.parse(setlists, :symbolize_names => true)


    #@setlist = result.first
    #if true
    #@setlist = setlist.save
      if user_signed_in?
        @request = current_user.requests.build(request_params)
        @request.setlist = @mbid
        @request.user = current_user
        @request_count = 0
      else
        @request = Request.new(request_params)
        @request.user_id = -1
        @request_count = 0
      end
    @request.setlist_id = @setlist_id
    @request.save
  end

  def update
    @request.update(request_params)
  end

  def destroy
    @request.destroy
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:request_text)
    end
end
