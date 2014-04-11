class AddTitleAndDescriptionToNeeds < ActiveRecord::Migration
  def change
    add_column :needs, :title, :string
    add_column :needs, :description, :string
  end
end
