class RemoveUserTransactionRoleFrom < ActiveRecord::Migration
  def change
    remove_column :donations, :user_id
    remove_column :donations, :transaction_id    
    remove_column :donations, :role_id
  end
end
