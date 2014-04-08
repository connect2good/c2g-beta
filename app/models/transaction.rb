class Transaction < ActiveRecord::Base
  has_many :transaction_user_roles
  has_many :users, through: :transaction_user_roles
  belongs_to :good

  def seller
    transaction_user_roles.find_by(role_id: Role.seller.id)
  end

  def donor
    transaction_user_roles.find_by(role_id: Role.donor.id)
  end

  def buyer
    transaction_user_roles.find_by(role_id: Role.buyer.id)
  end

  def beneficiary
    transaction_user_roles.find_by(role_id: Role.beneficiary.id)
  end

end
