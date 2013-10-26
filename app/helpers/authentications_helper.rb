module AuthenticationsHelper

	# function verify  there login ->
	def therelogin?
		if session[:login]
			true
		end
	end
	# <-
	# function to create easy log in--> 
		def login?(x,sess=false)
			
			z = User.find_by(x)
			if z.present?	
				if sess
					session[:login] = true
					sess.each do |x,l|
						session[x] = z.send(l)
					end
					return true
				end
				
			else
				false
			end
		end
	# <--

			def login2?(x)

			z = User.find_by(x)
			if z.present?
				if z.confirm == false or z.confirm == nil
					return true
				end
			else
				false
			end
		end

	def rolsession(x)
		if session[x].present?
			true
		end
	end

	#function to easy log out ->
		def outsession(*x)
			if session[:login]
				x.each do |x|
					session[:login] = nil
					session[x] = nil
				end
				true
			end

		end
	#<--

	#function for check type users ->
	def trueredirectpowersession(x,redirect=false)
		if session[:type] == x
			true
			if redirect or x=="home"
				redirect_to(redirect) and return
			end
		end
	end

	def falseredirectpowersession(x,redirect=false)
		if session[:type] == x
			true
		else
			if redirect
				redirect_to(redirect) and return
			end
		end
	end


	# <-


end
