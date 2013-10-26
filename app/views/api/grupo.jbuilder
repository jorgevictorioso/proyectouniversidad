json.array!(@grupo) do |x|
  json.extract!(x,:id,:ci,:nombre,:municipio_id, :profesore_id)

end