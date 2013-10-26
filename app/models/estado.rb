class Estado < ActiveRecord::Base
  has_many :municipios, :dependent => :destroy
end
