class AddClosedAtToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :closed_at, :datetime
  end
end
