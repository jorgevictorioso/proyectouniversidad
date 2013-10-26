class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :namec
      t.string :email
      t.integer :type
      t.boolean :confirm
      t.integer :estado_id
      t.string :dni
      t.string :telf

      t.timestamps
    end
  end
end
