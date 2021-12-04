class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :category
      t.integer :currency
      t.float :price
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
