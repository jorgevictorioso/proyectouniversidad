json.array!(@a) do |x|
  json.extract! x, :nombre, :apellido
end