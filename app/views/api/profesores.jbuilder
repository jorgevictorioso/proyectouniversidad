json.array!(@profesores) do |x|
json.extract! x, :nombre, :apellido, :id, :institucione_id
end