class RequestsController < ApplicationController
  require 'rest_client'
  before_action :request, only: [:show, :edit, :update, :destroy]

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def edit
  end

  def create
    @request = Request.new(request_params)
    @artist = params[:request][:artist]
    puts "artist is #{@artist}"
    @response = RestClient.get "http://api.setlist.fm/rest/0.1/search/setlists.json?artistName=#{@artist}"
    @response = JSON.parse @response
    @request.save
    @response['setlists']['setlist'].each do |data|
      @setlist = Setlist.new(mbid: data["artist"]["@mbid"], name: "#{data["artist"]["@name"]}, #{data["venue"]["@name"]}, #{data["@eventDate"]}", artist: data["artist"]["@name"], url_id: data["url"], request_id: @request)
      @setlist.save
      # puts "setlist id is #{@setlist_id}"
      # puts "sets is #{data["sets"]}"
      # puts "set is #{data["sets"]["set"]}"
      # puts "song is #{data["sets"]["set"]["song"]}"
      # puts "track name is #{data["sets"]["set"]["song"]["@name"]}"
      puts "data sets 0 is"
      puts data["sets"]["set"]
      if data["sets"].kind_of?(Array)
      @setloop = data["sets"][0]
        @setloop.each do |setdata|
          @trackloop = data["sets"][setdata[0]]
          @trackloop.each do |trackdata|
            Track.new(name: trackdata["@name"], setlist_id: @setlist)
            @track.save
            @setlist.update_attributes(tracks: @track)
          end
        end
      elsif data["sets"].kind_of?(Hash)
      @setloop = data["sets"]["set"]

        @setloop.each do |setdata|
          puts "setdata is"
          puts setdata
          puts "********"
          if setdata["song"].kind_of?(Array)
            @trackloop = setdata["song"]
            puts "********************"
            puts "trackloop is"
            puts @trackloop
            puts "********************"
            @trackloop.each do |trackdata|
            puts "********************"
            puts "trackdata is"
            puts trackdata
            puts "********************"
              @track = Track.new(name: trackdata["@name"], setlist_id: @setlist)
              puts "********************"
              puts "@track is"
              puts @track
              puts "********************"
              @track.save
            end
          else
              @trackloop = setdata["song"]
            puts "********************"
            puts "trackloop is"
            puts @trackloop
            puts "********************"
            @trackloop.each do |trackdata|
            puts "********************"
            puts "trackdata is"
            puts trackdata
            puts "********************"
            @name = trackdata[0]
            puts "********************"
            puts "@name is"
            puts @name
            puts "********************"
              @track = Track.new(name: @name, setlist_id: @setlist)
              puts "********************"
              puts "@track is"
              puts @track
              puts "********************"
              @track.save
              @setlist.update_attribute(:track_id, @track)

            end
          end
        end
      end

    end

    # @request.update_attributes

    # @response = Response.headers.to_str
    # RestClient.post "http://api.setlist.fm/rest/0.1/search/setlists.json?artistName=#{@artist}", :artist => @name
       redirect_to @request
    # else
    #   render :new
    #   flash[:error] = "Invalid request"
    # end
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
      params.require(:request).permit(:artist, :setlist, :user, :count)
     
    end

    # def request
    # @request.show
    # end

end
