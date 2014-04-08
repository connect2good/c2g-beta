class Role < ActiveRecord::Base
  has_many :transaction_user_roles

  def self.seller
    Role.find_by(name: 'seller')
  end

  def self.donor
    Role.find_by(name: 'donor')
  end

  def self.buyer
    Role.find_by(name: 'buyer')
  end

  def self.beneficiary
    Role.find_by(name: 'beneficiary')
  end

end
