class AddDescriptionToMerchandises < ActiveRecord::Migration
  def change
    add_column :merchandises, :description, :string
  end
end
