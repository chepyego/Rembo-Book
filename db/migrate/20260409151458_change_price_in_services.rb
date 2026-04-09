class ChangePriceInServices < ActiveRecord::Migration[8.0]
  def change
   change_column :services, :price, :decimal, precision: 8, scale: 2, using: 'price::numeric(8,2)'
  end
end
