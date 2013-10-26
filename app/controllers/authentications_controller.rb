class AuthenticationsController < ApplicationController
    include AuthenticationsHelper
    def index
    end

#creating form for new session ->
    def new
        @login = User.new

    end
# <-


#creating session ->
    def create

        @x = User.find_by(params_attribute)

        unless @x.present?
              flash[:notice] = "usuario o contraseña invalida"
            redirect_to(new_authentication_path) and return

        end

        if @x.confirm == false or @x.confirm == nil
            flash[:notice] = "Su cuenta no esta confirmada"
            redirect_to(new_authentication_path) and return
        elsif @x.present?
            session[:type] = @x.rol
            session[:cedula] = @x.dni
            session[:estado] = @x.estado_id
            session[:correo] = @x.email
            session[:usuario] = @x.id
            session[:nombre] = @x.nombre
            session[:apellido] = @x.apellido
            flash[:notice] = "#Bienvenido al sistema"
            redirect_to(home_path) and return
        end


       
    end
#<-

#close session ->
    def logout
            session[:type] = nil
            session[:cedula] = nil
            session[:estado] = nil
            session[:correo] = nil
            session[:usuario] = nil
            session[:nombre] = nil
            session[:apellido] = nil
            flash[:notice] = "#Ha cerrado sesiôn correctamente."
            redirect_to(new_authentication_path) and return
            
    end
#<-   

    private
#strong params ->
        def params_attribute
            params[:login]["password"] = Jdavidxp.new.crypmd5(params[:login]["password"])
            params.require(:login).permit(:username,:password)
        end
#<-
end
