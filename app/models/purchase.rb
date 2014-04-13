class Purchase < ActiveRecord::Base
  belongs_to :sale_item,
    class_name: 'Merchandise',
    foreign_key: 'merchandise_id'

  belongs_to :buyer,
    class_name: 'Individual',
    foreign_key: 'buyer_id'

    validates :agree, presence: :true
end
