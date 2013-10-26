class AddFileToNecesidade < ActiveRecord::Migration
  def change
  	change_table :necesidades do |x|
  		x.string :file_ext
  	end
  end
end
