class CreateComunals < ActiveRecord::Migration
  def change
    create_table :comunals do |t|
      t.string :nombrec
      t.string :direccion
      t.string :vocero
      t.string :telefono
      t.string :correo
      t.string :ejet
      t.string :map
      t.integer :user_id

      t.timestamps
    end
  end
end
