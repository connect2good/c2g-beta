class User < ActiveRecord::Base

  has_many :transaction_user_roles
  has_many :transactions, through: :transaction_user_roles
end
 