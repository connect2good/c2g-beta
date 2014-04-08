class AddGoodToTransactionUserRole < ActiveRecord::Migration
  def change
    add_column :transaction_user_roles, :good_id, :integer
  end
end
