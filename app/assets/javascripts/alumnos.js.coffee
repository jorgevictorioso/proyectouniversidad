# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#alumno_cedula").keyup ->
    if this.value
      $.post("/api/alumno/#{this.value}.json", ((x) ->
            document.getElementById("alumno_nombre").value = x[0].nombre
            document.getElementById("alumno_apellido").value = x[0].apellido
            ),'json')