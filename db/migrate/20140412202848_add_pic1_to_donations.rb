class AddPic1ToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :pic1, :string
    add_column :donations, :pic2, :string
    add_column :donations, :pic3, :string
  end
end
