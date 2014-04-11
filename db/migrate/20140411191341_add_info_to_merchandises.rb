class AddInfoToMerchandises < ActiveRecord::Migration
  def change
    add_column :merchandises, :individual_id, :integer
    add_column :merchandises, :organization_id, :integer
    add_column :merchandises, :pic1_id, :integer
    add_column :merchandises, :pic2_id, :integer
    add_column :merchandises, :pic3_id, :integer
  end
end
