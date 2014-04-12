class RemovePicIdFromMerchandise < ActiveRecord::Migration
  def change
    remove_column :merchandises, :pic1_id
    remove_column :merchandises, :pic2_id
    remove_column :merchandises, :pic3_id
  end
end
