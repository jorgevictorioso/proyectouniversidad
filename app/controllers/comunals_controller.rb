class ComunalsController < ApplicationController
	before_action :asigno, :only => [:create,:update,:edit]
	def index
		@c = User.find(session[:usuario]).comunal
		if @c.blank?
			redirect_to(new_comunal_path) and return
		end
	end

	def new
		@comunals = Comunal.new
		@title = "Registrar"
	end

	def create
		if @users.build_comunal(parametros).save
			redirect_to(home_comunal_path) and return
		end


	end

	def edit
		@title = "Editar"
		@comunals = Comunal.find(@users.comunal.id)
	end

	def update
		if @users.comunal.update(parametros)
			flash[:notice] = "#Consejo comunal editado con exito"
			redirect_to(comunals_path) and return
		end
	end

	private
	def asigno
		@users = User.find(session[:usuario])
	end
	def parametros
		params.require(:comunal).permit(:nombrec,:direccion,:vocero,:telefono,:correo,:ejet,:map)
	end

end
