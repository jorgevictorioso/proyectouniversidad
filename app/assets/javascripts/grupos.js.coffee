# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$("#cedula_profesor").keyup ->
  this.setCustomValidity("Profesor no existe")
  document.getElementById("nombre_profesor").value = ""
  $.getJSON("/api/profesor/#{this.value}.json",((x) ->
    if x.length
     document.getElementById("cedula_profesor").setCustomValidity("")
     document.getElementById("nombre_profesor").value = "#{x[0].nombre} #{x[0].apellido}"
    ))


$(document).ready ->
  $("#estado").change(->
    $.getJSON("/api/municipio/#{this.value}.json",(x) ->
      document.getElementById("municipio").options.length = 0;
      for h in x
        document.getElementById("municipio").options[document.getElementById("municipio").options.length] = new Option(h.nombre,h.id)

    )
      
    )
  


$(document).ready ->
  $("#categorias").change ->
    window.location = window.location + "?ok=1&necesidades=#{this.value}"




$(document).ready ->
  $("#prioridad").change ->
    window.location = window.location + "?ok=1&prioridad=#{this.value}"



