class AddAgreeToMerchandises < ActiveRecord::Migration
  def change
    add_column :merchandises, :agree, :boolean
  end
end
