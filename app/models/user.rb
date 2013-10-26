class User < ActiveRecord::Base
	has_one :comunal
	has_one :profesore
	has_many :grupo
	validates_uniqueness_of :dni, :message => "Hay un usuario registrado con esta cedula"
	validates_uniqueness_of :username, :message => "Hay un registro con este nombre de usuario"
	validates_uniqueness_of :email, :message => "Hay un registro con este correo"


	def password=(x)
		write_attribute(:password,Jdavidxp.new.crypmd5(x))
	end

	


end
