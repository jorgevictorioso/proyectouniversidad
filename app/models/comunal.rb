class Comunal < ActiveRecord::Base
	belongs_to :users
	has_many :necesidade
end
