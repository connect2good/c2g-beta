class Donation < ActiveRecord::Base
  belongs_to :donor,
    class_name: 'Individual',
    foreign_key: 'donor_id'

  belongs_to :need

  mount_uploader :pic1, ImageUploader
  mount_uploader :pic2, ImageUploader
  mount_uploader :pic3, ImageUploader
end
