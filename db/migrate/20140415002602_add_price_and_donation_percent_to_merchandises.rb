class AddPriceAndDonationPercentToMerchandises < ActiveRecord::Migration
  def change
    add_column :merchandises, :price, :float
    add_column :merchandises, :donation_percent, :integer
  end
end
