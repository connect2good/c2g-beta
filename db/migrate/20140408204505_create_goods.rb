class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :description
      t.string :type

      t.timestamps
    end
  end
end
