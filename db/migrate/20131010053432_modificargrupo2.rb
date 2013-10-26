class Modificargrupo2 < ActiveRecord::Migration
  def change
  	change_table :grupos do |x|
  		x.remove :usuario_id
  		x.integer :user_id
  	end
  end
end
