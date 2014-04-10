class AddTitleToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :title, :string
  end
end
