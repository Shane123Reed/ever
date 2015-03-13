json.array!(@downloads) do |download|
  json.extract! download, :id, :name, :email, :count, :ip
  json.url download_url(download, format: :json)
end
