class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :good_id
      t.string :status
      t.datetime :closed_at

      t.timestamps
    end
  end
end
