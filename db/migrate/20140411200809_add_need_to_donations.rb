class AddNeedToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :need_id, :integer
  end
end
