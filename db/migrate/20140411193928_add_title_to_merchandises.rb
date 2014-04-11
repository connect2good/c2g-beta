class AddTitleToMerchandises < ActiveRecord::Migration
  def change
    add_column :merchandises, :title, :string
  end
end
