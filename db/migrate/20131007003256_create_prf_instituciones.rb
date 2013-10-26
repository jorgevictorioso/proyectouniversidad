class CreatePrfInstituciones < ActiveRecord::Migration
  def change
    create_table :prf_instituciones do |t|
      t.integer :profesore_id
      t.integer :institucione_id

      t.timestamps
    end
  end
end
