json.array!(@requests) do |request|
  json.extract! request, :id, :setlist, :user, :request_count
  json.url request_url(request, format: :json)
end
