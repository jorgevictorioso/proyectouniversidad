json.array!(@p) do |x|
	json.extract! x, :nombre, :apellido
end