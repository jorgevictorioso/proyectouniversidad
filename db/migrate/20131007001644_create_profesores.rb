class CreateProfesores < ActiveRecord::Migration
  def change
    create_table :profesores do |t|
      t.integer :user_id
      t.integer :prf_institucione
      t.integer :grupo_id
      t.integer :estado_id

      t.timestamps
    end
  end
end
