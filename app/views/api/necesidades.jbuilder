json.array!(@necesidades) do |x|
  json.extract!(x,:id,:categoria,:prioridad,:description,:proceso,:comunal_id)

end