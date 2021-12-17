class ChangePriceToIntFromOrder < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :price, :integer
  end
end
