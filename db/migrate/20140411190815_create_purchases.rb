class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :merchandise_id
      t.string :status
    end
  end
end
