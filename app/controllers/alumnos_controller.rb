class AlumnosController < ApplicationController
  before_action :set_alumno, only: [:show, :edit, :update, :destroy]

  # GET /alumnos
  # GET /alumnos.json
  def index
    @alumnos = Alumno.all
  end

  # GET /alumnos/1
  # GET /alumnos/1.json
  def show
  end

  

  # GET /alumnos/new
  def new
    @alumno = User.find(session[:usuario]).grupo.last.alumno.new
    @__title = "Registrar"
  end

  # GET /alumnos/1/edit
  def edit
    @__title = "Editar"
  end

  # POST /alumnos
  # POST /alumnos.json
  def create

    if @alumno = User.find(session[:usuario]).grupo.last.alumno.length == 6
      flash[:notice] = "El limite de alumnos es de 6 personas"
      redirect_to(home_alumno_path) and return
    end


    if @alumno = User.find(session[:usuario]).grupo.last.alumno.where(:cedula => params[:alumno]['cedula']).length >0
      flash[:notice] = "Ya registraste un alumno con esta cedula"
      @alumno = Alumno.new(alumno_params)
      @__title = "Crear nuevo alumno"

      render 'new' and return
    end

    @alumno = User.find(session[:usuario]).grupo.last.alumno.new(alumno_params)

    respond_to do |format|
      if @alumno.save
        format.html { redirect_to grupos_path, notice: '#Nuevo alumno agregado al grupo' }
        format.json { render action: 'show', status: :created, location: @alumno }
      else
        format.html { render action: 'new' }
        format.json { render json: @alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alumnos/1
  # PATCH/PUT /alumnos/1.json
  def update
    respond_to do |format|
      if @alumno.update(alumno_params)
        format.html { redirect_to grupos_path, notice: '#datos actualizados' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alumnos/1
  # DELETE /alumnos/1.json
  def destroy
    @alumno.destroy
    respond_to do |format|
      format.html { redirect_to grupos_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alumno
      @alumno = Alumno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alumno_params
      params.require(:alumno).permit(:nombre, :apellido, :cedula)
    end
end
