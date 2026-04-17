class CreateTenants < ActiveRecord::Migration[8.0]
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :subdomain
      t.string :email
      t.string :phone_number
      t.string :location
      t.string :plan
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :tenants, :subdomain, unique: true
  end
end
