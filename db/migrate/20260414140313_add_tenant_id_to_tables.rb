class AddTenantIdToTables < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :tenant_id, :bigint
    add_column :bookings, :tenant_id, :bigint
    add_column :services, :tenant_id, :bigint
    add_column :manicurists, :tenant_id, :bigint
    add_column :clients, :tenant_id, :bigint
    add_column :schedules, :tenant_id, :bigint

    add_foreign_key :users, :tenants
    add_foreign_key :bookings, :tenants
    add_foreign_key :services, :tenants
    add_foreign_key :manicurists, :tenants
    add_foreign_key :clients, :tenants
    add_foreign_key :schedules, :tenants
  end
end
