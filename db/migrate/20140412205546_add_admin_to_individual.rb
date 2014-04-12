class AddAdminToIndividual < ActiveRecord::Migration
  def change
    add_column :individuals, :admin, :boolean, default: false
  end
end
