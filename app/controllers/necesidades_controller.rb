class NecesidadesController < ApplicationController
	before_action :asignar, :only => [:new,:create,:edit,:update,:destroy]
	def new
		@title = "Registrar"
		@necesidades = @users.necesidade.new
	end

	def index
		@n = Necesidade.order(id: :desc)
	end

	def create
		@x = @users.necesidade.new(parametros)
		if @x.save
			flash[:notice] = "#Se registro una necesidad con exito"
			redirect_to(necesidades_path) and return
		end
	end

	def edit
		@title ="Editar"
		@necesidades = @users.necesidade.find(params[:id])
	end

	def update
		if @users.necesidade.find(params[:id]).update(parametros)
			flash[:notice] = "#se edito un usuario con exito"
			redirect_to(necesidades_path) and return
		end
	end

	def destroy
		if @users.necesidade.find(params[:id]).destroy
			flash[:notice] = "#se elimino una necesidad con exito"
			redirect_to(necesidades_path) and return
		end
	end

	private

	def parametros
		params.require(:necesidade).permit(:categoria,:prioridad,:description,:file_ext)
	end
	def asignar
		@users = User.find(session[:usuario]).comunal
	end
end
