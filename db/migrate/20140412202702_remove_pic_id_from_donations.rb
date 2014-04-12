class RemovePicIdFromDonations < ActiveRecord::Migration
  def change
    remove_column :donations, :pic1_id
    remove_column :donations, :pic2_id
    remove_column :donations, :pic3_id
  end
end
