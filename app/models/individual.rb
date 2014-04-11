class Individual < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :sale_items,
    class_name: 'Merchandise',
    foreign_key: 'individual_id'

  has_many :donations,
    class_name: 'Donation',
    foreign_key: 'donor_id'

  has_many :purchases,
    class_name: 'Purchase',
    foreign_key: 'buyer_id'

end
