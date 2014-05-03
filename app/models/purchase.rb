require 'balanced'

class Purchase < ActiveRecord::Base
  belongs_to :sale_item,
    class_name: 'Merchandise',
    foreign_key: 'merchandise_id'

  belongs_to :buyer,
    class_name: 'Individual',
    foreign_key: 'buyer_id'

    # validates :agree, presence: :true

  def initialize(email, amount, credit_card_hash)
    @email = email
    @amount = (amount * 100).to_i
    @credit_card_hash = credit_card_hash
    @buyer = nil
    @card = nil
    @errors = []
  end


end
