json.array!(@a) do |x|
  json.extract! x, :nombre, :apellido ,:grupo_id
end