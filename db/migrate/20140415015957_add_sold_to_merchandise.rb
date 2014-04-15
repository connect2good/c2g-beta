class AddSoldToMerchandise < ActiveRecord::Migration
  def change
    add_column :merchandises, :sold, :boolean
  end
end
