class Transaction < ActiveRecord::Base
  has_one :good
  has_many :transaction_user_roles
  has_many :users, through: :transaction_user_roles
end
