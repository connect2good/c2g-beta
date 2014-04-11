class AddBuyerToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :buyer_id, :integer
  end
end
