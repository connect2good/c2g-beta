class AddPicsToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :pic1_id, :integer
    add_column :donations, :pic2_id, :integer
    add_column :donations, :pic3_id, :integer
  end
end
