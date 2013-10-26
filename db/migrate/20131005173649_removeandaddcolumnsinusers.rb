class Removeandaddcolumnsinusers < ActiveRecord::Migration
  def change
  	change_table :users do |x|
  		x.remove :nombrec
  		x.string :nombre
  		x.string :apellido
  		
  	end
  end
end
