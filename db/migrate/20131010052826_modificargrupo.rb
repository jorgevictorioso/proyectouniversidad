class Modificargrupo < ActiveRecord::Migration
  def change
  	change_table :grupos do |x|
  		x.integer :usuario_id
  		x.boolean :aprobado
  	end
  end
end
