json.array!(@tracks) do |request|
  json.extract! track, :name, :setlist_ids
  json.url track_url(track, format: :json)
end

