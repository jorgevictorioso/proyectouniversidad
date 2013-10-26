class Asas < ActiveRecord::Migration
  def change
  	change_table :grupos do |x|
  		x.integer :institucione_id
  	end
  end
end
