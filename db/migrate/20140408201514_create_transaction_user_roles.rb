class CreateTransactionUserRoles < ActiveRecord::Migration
  def change
    create_table :transaction_user_roles do |t|
      t.integer :user_id
      t.integer :transaction_id
      t.integer :role_id

      t.timestamps
    end
  end
end
