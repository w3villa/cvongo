json.array!(@societies) do |society|
  json.extract! society, :id, :name, :locality_id
  json.url society_url(society, format: :json)
end
