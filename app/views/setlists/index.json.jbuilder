json.array!(@setlists) do |setlist|
  json.extract! setlist, :id, :mbid, :name, :artist, :plays
  json.url setlist_url(setlist, format: :json)
end
