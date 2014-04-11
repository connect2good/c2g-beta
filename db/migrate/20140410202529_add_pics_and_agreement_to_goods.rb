class AddPicsAndAgreementToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :pic1, :string
    add_column :goods, :pic2, :string
    add_column :goods, :pic3, :string
    add_column :goods, :agree, :boolean
  end
end
