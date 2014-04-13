class AddDescriptionToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :description, :string
  end
end
