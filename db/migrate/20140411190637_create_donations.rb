class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.integer :transaction_id
      t.integer :role_id
    end
  end
end
