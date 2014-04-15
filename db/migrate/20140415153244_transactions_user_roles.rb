class TransactionsUserRoles < ActiveRecord::Migration
  def change
    drop_table :transaction_user_roles
  end
end
