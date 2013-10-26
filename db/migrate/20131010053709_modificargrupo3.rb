class Modificargrupo3 < ActiveRecord::Migration
  def change
  	change_table :grupos do |x|
  		x.integer :profesor_id
  	end
  end
end
