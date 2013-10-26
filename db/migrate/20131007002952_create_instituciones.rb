class CreateInstituciones < ActiveRecord::Migration
  def change
    create_table :instituciones do |t|
      t.string :nombre
      t.text :direccion
      t.integer :estado_id

      t.timestamps
    end
  end
end
