class ApiController < ApplicationController
	def profesor
		@p = User.where(:dni => params[:dni], :rol => 3)
	end

  def municipio
    @m = Municipio.where(:estado_id => params[:id])
  end

  def alumno
    if Security.find_by(ip: request.ip).present?
      @a = Alumno.where(:cedula => params[:id])
    else
      render :text => "Usted no tiene acceso" and return
    end

  end

  def profesores
    @profesores = Prfinstucione.where(cedula:params[:id])
  end

  def comunal
    @comunal = Comunal.all
  end

  def grupo
    @grupo = Grupo.all
  end

  def necesidades
     @necesidades = Necesidade.all
  end


end
