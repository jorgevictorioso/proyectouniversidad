# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("#necesidade_file_ext").ready(->
		$("#necesidade_file_ext").change(->
				if !/.pdf/.test(this.value)
					this.setCustomValidity("el formato del documento tiene que ser en pdf")
			)

		$("#necesidade_file_ext").click(->
				alert("Requisitos del Archivo \n \n Archivo debe estar formato PDF \n El contenido del mismo debe contener: \n 1.- Nombre de la necesidad. \n 2.- Descripción de la necesidad lo mas detallada posible. \n 3.- cobertura geográfica. \n 4.- Cobertura poblacional. \n 5.- Cantidad de Personas beneficiadas. \n")
			)
	)