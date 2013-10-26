class Changenamecolumnsinusers < ActiveRecord::Migration
  def change
  	rename_column :users, :type, :rol
  end
end
