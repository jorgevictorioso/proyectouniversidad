class SecuritiesController < ApplicationController
  before_action :set_security, only: [:show, :edit, :update, :destroy]
  include AuthenticationsHelper

  # GET /securities
  # GET /securities.json
  def index
    falseredirectpowersession(4,new_authentication_path)
    @securities = Security.all
  end

  # GET /securities/1
  # GET /securities/1.json
  def show
     falseredirectpowersession(4,new_authentication_path)
  end

  # GET /securities/new
  def new
    @__title = "Crear"
     falseredirectpowersession(4,new_authentication_path)
    @security = Security.new
  end

  # GET /securities/1/edit
  def edit
    @__title = "Actualizar"
     falseredirectpowersession(4,new_authentication_path)
  end

  # POST /securities
  # POST /securities.json
  def create
     falseredirectpowersession(4,new_authentication_path)
    @security = Security.new(security_params)

    respond_to do |format|
      if @security.save
        format.html { redirect_to @security, notice: 'Security was successfully created.' }
        format.json { render action: 'show', status: :created, location: @security }
      else
        format.html { render action: 'new' }
        format.json { render json: @security.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /securities/1
  # PATCH/PUT /securities/1.json
  def update
    respond_to do |format|
      if @security.update(security_params)
        format.html { redirect_to @security, notice: 'Security was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @security.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /securities/1
  # DELETE /securities/1.json
  def destroy
    @security.destroy
    respond_to do |format|
      format.html { redirect_to securities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security
      falseredirectpowersession(4,home_path)
      @security = Security.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def security_params
      falseredirectpowersession(4,home_path)
      params.require(:security).permit(:nombre, :ip)
    end
end
