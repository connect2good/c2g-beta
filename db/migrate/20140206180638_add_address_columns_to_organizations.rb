class AddAddressColumnsToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :street, :string
    add_column :organizations, :city, :string
    add_column :organizations, :state, :string
    add_column :organizations, :zip, :string
  end
end
