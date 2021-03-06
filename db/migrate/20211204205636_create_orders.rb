class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :category
      t.date :date
      t.text :description
      t.references :client, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
