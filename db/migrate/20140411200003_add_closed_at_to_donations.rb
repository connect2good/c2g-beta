class AddClosedAtToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :closed_at, :datetime
  end
end
