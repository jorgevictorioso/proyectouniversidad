class Profesore < ActiveRecord::Base
	belongs_to :users
	has_many :grupo
  has_many :prfinstuciones, :dependent => :destroy
end
