class Transaction < ActiveRecord::Base
  has_many :transaction_user_roles
  has_many :users, through: :transaction_user_roles
  has_many :organizations, through: :transaction_user_roles
  has_many :individuals, through: :transaction_user_roles
  belongs_to :good

  def role(type)
    case type
    when "seller"
      role_id = Role.seller.id if type == "seller"
    when "buyer"
      role_id = Role.buyer.id if type == "buyer"
    when "donor"
      role_id = Role.donor.id if type == "donor"
    when "beneficiary"
      role_id = Role.beneficiary.id if type == "beneficiary"
    else
      # fall back case
    end
    transaction_user_roles.find_by(role_id: role_id)
  end

  def user_name(type)
    case type
    when "seller"
      seller = transaction_user_roles.find_by(role_id: Role.seller.id)
      seller.user.name if seller
    when "buyer"
      buyer = transaction_user_roles.find_by(role_id: Role.buyer.id)
      buyer.user.name if buyer
    when "donor"
      donor = transaction_user_roles.find_by(role_id: Role.donor.id)
      donor.user.name if donor
    when "beneficiary"
      beneficiary = transaction_user_roles.find_by(role_id: Role.beneficiary.id)
      beneficiary.user.name if beneficiary
    end
  end
end

