class RemoveGoodToTransactionUserRole < ActiveRecord::Migration
  def change
    remove_column :transaction_user_roles, :good_id, :integer
  end
end
