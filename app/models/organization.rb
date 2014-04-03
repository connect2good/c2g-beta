class Organization < ActiveRecord::Base
  belongs_to :owner,
    class_name: 'User',
    foreign_key: 'owner_id'

  has_many :needs
  has_many :offers
  validates_associated :owner
  validates :name, presence: true
  validates :city, presence: true
  mount_uploader :image, ImageUploader


 

end
