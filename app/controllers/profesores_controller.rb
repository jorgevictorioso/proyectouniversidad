class ProfesoresController < ApplicationController
	before_action :set_x, :only => [:new,:index,:create,:grupos]
	def index
		if @user.profesore.blank?
			redirect_to(new_profesore_path) and return
		end
		@x = Prfinstucione.where(profesore_id:@user.profesore.id)
	end

	def new
		@profesores = @user.build_profesore()
	end

	def grupos
	

		if @user.profesore.blank?
			redirect_to(new_profesore_path) and return
		end
		

		@lista = User.find(session[:usuario]).profesore.grupo.where(:aprobado => nil)


	end

	def ver
		@g = Grupo.find(params[:id])
		@l = Grupo.find(params[:id]).alumno.all
		@n = Grupo.find(params[:id]).necesidade

	end

	def cambiar
	end

	def aprobar
		if Grupo.find(params[:id]).update(aprobado:true)
			flash[:notice] = "#Grupo aprobado"
			redirect_to(home_profesor_path) and return
		end
	end

	def reprobar
		if Grupo.find(params[:id]).update(aprobado:false)
			Necesidade.find_by(grupo_id:params[:id]).update(grupo_id: nil,proceso: nil)
			flash[:notice] = "#Grupo reprobado"
			redirect_to(home_profesor_path) and return
		end

	end

	def registrar
		params.permit!
		if Necesidade.find(params[:id]).update(params[:status])
			flash[:notice] = "#Status cambiado con exito"
			redirect_to(home_profesor_path) and return
		end
	end

	def create
		@profesore = @user.build_profesore(:user_id => session[:usuario])
		@profesore.user_id = session[:usuario]
		if @profesore.save
			@x = Prfinstucione.new
			@x.institucione_id = params[:profesore]["prf_institucione"]
			@x.profesore_id = @profesore.id
			@x.nombre = session[:nombre]
			@x.apellido = session[:apellido]
			@x.cedula = session[:cedula]
			if @x.save
				flash[:notice] = "#Datos Actualizados"
				redirect_to(home_profesor_path) and return
			end

		end
	end

	private
	def set_x
		@user = User.find(session[:usuario])
	end
end
