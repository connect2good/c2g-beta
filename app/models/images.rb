class Images < ActiveRecord::Base
  belongs_to :merchandise
  belongs_to :donation

  mount_uploader :pic, ImageUploader
end
