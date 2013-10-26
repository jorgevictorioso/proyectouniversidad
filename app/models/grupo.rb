class Grupo < ActiveRecord::Base
	belongs_to :users
	belongs_to :profesores
	has_many :alumno, :dependent => :destroy
	has_one :necesidade
end
