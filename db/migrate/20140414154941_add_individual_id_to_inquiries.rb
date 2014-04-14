class AddIndividualIdToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :individual_id, :integer
  end
end
