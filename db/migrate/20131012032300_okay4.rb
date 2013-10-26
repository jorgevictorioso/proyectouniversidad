class Okay4 < ActiveRecord::Migration
  def change
  	change_table :grupos do |x|
  		x.remove :profesor_id
  		x.integer :profesore_id
  	end
  end
end
