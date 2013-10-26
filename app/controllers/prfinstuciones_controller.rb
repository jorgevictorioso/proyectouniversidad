class PrfinstucionesController < ApplicationController
	before_action :sex, :only => [:new,:create]
  def index
  end

  def edit
    @prfinstuciones = Prfinstucione.find(params[:id])
  end

  def new
    @prfinstuciones = Prfinstucione.new
  end

  def create
    @x = Prfinstucione.new
    @x.institucione_id = params[:prfinstucione]["institucione_id"]
    @x.profesore_id = @user.profesore.id
    @x.nombre = session[:nombre]
    @x.apellido = session[:apellido]
    @x.cedula = session[:cedula]
    if @x.save
      flash[:notice] = "#Registro una institucion con exito"
      redirect_to(profesores_path) and return
    end

  end

  def update
    if Prfinstucione.find(params[:id]).update(:institucione_id => params[:prfinstucione]["institucione_id"])
      flash[:notice] = "#se actualizo con exito"
      redirect_to(profesores_path) and return
    end

  end

  def destroy
    if Prfinstucione.find(params[:id]).destroy
      flash[:notice] = "#Datos Actualizados"
      redirect_to(profesores_path) and return
    end
  end

  private
  def sex
  	@user = User.find(session[:usuario])
  end
end
