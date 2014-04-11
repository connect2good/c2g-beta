class Donation < ActiveRecord::Base
  belongs_to :donor,
    class_name: 'Individual',
    foreign_key: 'donor_id'

  belongs_to :need
  
end
