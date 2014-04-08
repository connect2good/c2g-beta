class RemoveEmailFromRoles < ActiveRecord::Migration
  def change
    remove_column :roles, :email, :string
  end
end
