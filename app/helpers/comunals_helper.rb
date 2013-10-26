module ComunalsHelper
	def leerins(x)
		Institucione.find(x).nombre
	end
end
