class DropGoodsTable < ActiveRecord::Migration
  def change
    drop_table :goods
  end
end
