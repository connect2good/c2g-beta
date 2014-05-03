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

  def create_card
  begin
    @card = Balanced::Card.new(@credit_card_hash).save 
  rescue
    @errors << 'Your credit card is invalid'
  end
end

def find_or_create_buyer
  begin
    buyer = Balanced::Account.find_by_email(@email)
    if buyer.present?
      @buyer = buyer
    else
      @buyer = Balanced::Marketplace.my_marketplace.create_buyer(@email, @card.uri)
    end
  rescue
    @errors << 'Your account is invalid'
  end
end

def debit_buyer
  begin
    payment = @buyer.debit(@amount, "Everkitten.com")
  rescue
    @errors << 'Your credit card could not be charged'
  end
end
end
