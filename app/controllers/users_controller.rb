class UsersController < ApplicationController
	def new
		@users = User.new
	end

	def olvide
	end

	def cambiar


	end

	def cambiarcontra
		params.permit
		if User.find(params[:id]).update(:password => params[:change]["password"])
			flash[:notice] = "#Cambiada con exito"
			redirect_to(new_authentication_path) and return
		end
	end

	def enviarc
		params.permit!

    unless verify_recaptcha
      flash[:notice] = "Escriba correctamente la capcha"
      redirect_to(olvide_path) and return
    end
		@x = User.find_by(params[:olvide])
		if @x.present?
			Correo.mycorreo("Recuperar contrasena", "<a href='http://localhost:3000/recuperarcontrasena/#{@x.password}/#{@x.id}'> precione aqui para recuperar contrasena</a>",@x.email).deliver!
        	flash[:notice] = "#verifique su correo para recuperar contrasena"
        	redirect_to(new_authentication_path) and return
        else
        	flash[:notice] = "correo electronico no existe"
        	redirect_to(new_authentication_path) and return
   

		end
	end

	def create
		@users = User.new(paramsx)
		respond_to  do |format|
			if verify_recaptcha
				if @users.save
					if @users.rol == 1
						 Correo.mycorreo("Cofirmacion de Usuario","<b>Nombre: #{@users.nombre} #{@users.apellido} </b> <br> <b>Cedula: #{@users.dni} </b>  <br> <b>Telefono: #{@users.telf} </b> <br>  <h1>Consejo Comunal </h1> <br> <a href='http://localhost:3000/confirmar/#{@users.password}/#{@users.id}'>HAS CLICK AQUI PARA CONFIRMAR SU CUENTA </a>","interoperatibilidad.mio@gmail.com").deliver!
            			 Correo.mycorreo("Registro interoperatibilidad Proyecto","<h2><b>Hola! #{@users.nombre} </b></h2> <br><b> Gracias por registrarse pronto sera contactado por nuestro equipo para la verificacion de sus datos y confirmar su cuenta.</b> <br><b>Un cordial saludo </b> <br><b>El Equipo del Marco de interoperatibidad (MIO)</b>",@users.email).deliver!
					end

					if @users.rol == 3
						 Correo.mycorreo("Cofirmacion de Usuario","<b>Nombre: #{@users.nombre} #{@users.apellido} </b> <br> <b>Cedula: #{@users.dni} </b>  <br> <b>Telefono: #{@users.telf} </b> <br>  <h1>Profesor </h1> <br> <a href='http://localhost:3000/confirmar/#{@users.password}/#{@users.id}'>HAS CLICK AQUI PARA CONFIRMAR SU CUENTA </a>","interoperatibilidad.mio@gmail.com").deliver!
            			 Correo.mycorreo("Registro interoperatibilidad Proyecto","<h2><b>Hola! #{@users.nombre} </b></h2> <br><b> Gracias por registrarse pronto sera contactado por nuestro equipo para la verificacion de sus datos y confirmar su cuenta.</b> <br><b>Un cordial saludo </b> <br><b>El Equipo del Marco de interoperatibidad (MIO)</b>",@users.email).deliver!
					end

					if @users.rol == 2
						 Correo.mycorreo("Cofirmacion de Usuario","<b>Nombre: #{@users.nombre} #{@users.apellido} </b> <br> <b>Cedula: #{@users.dni} </b>  <br> <b>Telefono: #{@users.telf} </b> <br>  <h1>Estudiante</h1> <br> <a href='http://localhost:3000/confirmar/#{@users.password}/#{@users.id}'>HAS CLICK AQUI PARA CONFIRMAR SU CUENTA </a>",@users.email).deliver!
            			# Correo.mycorreo("Registro interoperatibilidad Proyecto","<h2><b>Hola! #{@users.nombre} </b></h2> <br><b> Gracias por registrarse pronto sera contactado por nuestro equipo para la verificacion de sus datos y confirmar su cuenta.</b> <br><b>Un cordial saludo </b> <br><b>El Equipo del Marco de interoperatibidad (MIO)</b>",@users.email).deliver!
					end




					flash[:notice] = "#Se registro un usuario con exito"
					redirect_to(home_path) and return
				else
					flash[:notice] = "#{mensajerrror(@users)}"
          			format.html {render :action => "new"}
				end
			else
				 flash[:notice] = "Esciba en la capcha correctamente"
				 format.html {render :action => "new"}

			end
		end
	    

		
	end

	def confirmar
		@xd = User.find_by(:password => params[:codigo], :id => params[:id], :confirm => nil)
  	if @xd.present?
  		if @xd.update(:confirm => "true")
        Correo.mycorreo("confirmacion de cuenta","<h2><b>Felicidades! </b></h2> <br><b>Su cuenta se confirmo correctamente</b><br>" "<a href='http://localhost:3000'> Presione Aqui Para ir a la Pagina</a>",@xd.email).deliver!
  			flash[:notice] = "#se confirmo su cuenta con exito"
  			redirect_to(new_authentication_path) and return
  		end
  	else
  			flash[:notice] = "Error de Confirmacion"
  			redirect_to(new_authentication_path) and return

  end
	end

	private
	def paramsx
		params.require(:user).permit(:nombre,:apellido,:username,:password,:email,:estado_id,:dni,:rol,:telf)
	end
end
