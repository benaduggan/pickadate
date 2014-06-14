json.array!(@dorms) do |dorm|
  json.extract! dorm, :id, :name
  json.url dorm_url(dorm, format: :json)
end
