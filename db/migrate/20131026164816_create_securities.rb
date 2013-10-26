class CreateSecurities < ActiveRecord::Migration
  def change
    create_table :securities do |t|
      t.string :nombre
      t.string :ip

      t.timestamps
    end
  end
end
