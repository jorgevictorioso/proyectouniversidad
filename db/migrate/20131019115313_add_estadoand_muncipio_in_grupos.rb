class AddEstadoandMuncipioInGrupos < ActiveRecord::Migration
  def change
    change_table :grupos do |x|
      x.integer :estado_id
      x.integer :municipio_id
      x.string :nombrep
    end
  end
end
