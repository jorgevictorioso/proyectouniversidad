class GruposController < ApplicationController
	before_action :setx, :only => [:new,:show,:create,:update]
  before_action :security, :only => [:new,:create]
  def index
     if User.find(session[:usuario]).grupo.last.present?
      if User.find(session[:usuario]).grupo.last.aprobado == false or User.find(session[:usuario]).grupo.last.aprobado == true
        redirect_to(new_grupo_path) and return
      end
        @alumno = User.find(session[:usuario]).grupo.last.alumno.all
        @x = User.find(session[:usuario]).grupo.last
      else
        redirect_to(new_grupo_path) and return
     end
  end

  def edit
    params.permit!
    @__title ="Editar"
    @grupos =  User.find(session[:usuario]).grupo.last

  end

  def update
    params.permit!
    if Prfinstucione.find_by(:cedula => params[:cedula_profesor],:institucione_id => params[:grupo][:institucione_id]).blank?
      flash[:notice] = "Ese profesor no pertenece a esa institucion"
      redirect_to(new_grupo_path) and return
    end
    if  User.find(session[:usuario]).grupo.last.update(parametros)
      flash[:notice] = "#Grupo edito con exito"
      redirect_to(grupos_path) and return
    end

  end

  def new
  	@grupos = @u.grupo.new()
  end

  def show
  end

  def elegir
    if Necesidade.find(params[:id]).update(grupo_id:params[:grupo],proceso:1)
      flash[:notice] = "#Elegiste un proyecto con exito"
      redirect_to(home_alumno_path) and return
    end
  end

  def create
    if Prfinstucione.find_by(:cedula => params[:cedula_profesor],:institucione_id => params[:grupo][:institucione_id]).blank?
      flash[:notice] = "Ese profesor no pertenece a esa institucion"
      redirect_to(new_grupo_path) and return
    end

    #render :text  => params[:cedula_profesor] and return

  	@g = Grupo.new(parametros)
    @g.user_id = session[:usuario]
    @g.profesore_id = Profesore.find_by(user_id: User.find_by(:dni =>params[:cedula_profesor]).id).id

  	if @g.save
  		flash[:notice] = "#Registro grupo con exito"
  		redirect_to(home_path) and return
  	end
  end

  def necesidades
    @necesidades = Necesidade.where(:proceso => nil)
    if params[:ok].present?
      @necesidades = Necesidade.where("categoria = '#{params[:necesidades]}' or prioridad = '#{params[:prioridad]}'")

    end
    @x = User.find(session[:usuario]).grupo.last

  end

  private
  def setx
  	@u = User.find(session[:usuario])
  end
  	def parametros

  		params.require(:grupo).permit(:nombre,:ci,:institucione_id,:estado_id,:municipio_id,:nombrep)

  	end

    def security
      if User.find(session[:usuario]).grupo.blank?
        else
          if User.find(session[:usuario]).grupo.last.aprobado == nil
          redirect_to(grupos_path) and return
        end
      end
    end
end
