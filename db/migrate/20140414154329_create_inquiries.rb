class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.integer :merchandise_id
      t.text :comment

      t.timestamps
    end
  end
end
