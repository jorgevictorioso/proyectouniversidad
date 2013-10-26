class Xa < ActiveRecord::Migration
  def change
  	change_table :necesidades do |x|
  		x.integer :grupo_id

  	end
  end
end
