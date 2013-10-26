class Addx2 < ActiveRecord::Migration
  def change
  	change_table :alumnos do |x|
  		x.integer :grupo_id
  	end
  end
end
