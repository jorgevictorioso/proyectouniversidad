class Okay2 < ActiveRecord::Migration
  def change
  	change_table :prfinstuciones do |x|
  		x.integer :user_id
  	end
  end
end
