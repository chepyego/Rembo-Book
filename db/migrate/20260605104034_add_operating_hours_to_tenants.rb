class AddOperatingHoursToTenants < ActiveRecord::Migration[8.0]
  def change
    add_column :tenants, :operating_hours, :string
  end
end
