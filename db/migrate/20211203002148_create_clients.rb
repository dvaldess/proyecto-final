class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :rut
      t.string :name
      t.string :address
      t.integer :phone
      t.integer :type

      t.timestamps
    end
  end
end
