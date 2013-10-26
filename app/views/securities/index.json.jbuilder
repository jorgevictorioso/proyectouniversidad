json.array!(@securities) do |security|
  json.extract! security, :nombre, :ip
  json.url security_url(security, format: :json)
end
