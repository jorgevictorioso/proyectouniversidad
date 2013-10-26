class CreatePrfinstuciones < ActiveRecord::Migration
  def change
    create_table :prfinstuciones do |t|
      t.integer :institucione_id
      t.integer :profesore_id
      t.string :nombre
      t.string :apellido
      t.string :cedula

      t.timestamps
    end
  end
end
