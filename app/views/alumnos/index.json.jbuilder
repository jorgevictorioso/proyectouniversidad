json.array!(@alumnos) do |alumno|
  json.extract! alumno, :nombre, :apellido, :cedula
  json.url alumno_url(alumno, format: :json)
end
