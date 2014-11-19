json.array!(@setlists) do |setlist|
  json.extract! setlist, :id, :mbid, :name, :artist, :url_id
  json.url setlist_url(setlist, format: :json)
end
