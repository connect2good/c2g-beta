class AddPic1ToMerchandises < ActiveRecord::Migration
  def change
    add_column :merchandises, :pic1, :string
    add_column :merchandises, :pic2, :string
    add_column :merchandises, :pic3, :string
  end
end
