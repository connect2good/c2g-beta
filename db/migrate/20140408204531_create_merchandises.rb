class CreateMerchandises < ActiveRecord::Migration
  def change
    create_table :merchandises do |t|

      t.timestamps
    end
  end
end
