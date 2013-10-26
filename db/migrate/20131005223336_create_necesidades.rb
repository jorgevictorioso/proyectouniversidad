class CreateNecesidades < ActiveRecord::Migration
  def change
    create_table :necesidades do |t|
      t.string :categoria
      t.string :prioridad
      t.text :description
      t.date :fecha
      t.integer :proceso
      t.integer :comunal_id

      t.timestamps
    end
  end
end
