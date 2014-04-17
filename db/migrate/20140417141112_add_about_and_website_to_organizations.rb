class AddAboutAndWebsiteToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :about, :text
    add_column :organizations, :website, :string
  end
end
