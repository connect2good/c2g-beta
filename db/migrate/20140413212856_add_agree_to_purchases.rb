class AddAgreeToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :agree, :boolean
  end
end
