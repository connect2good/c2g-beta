class TransactionUserRole < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :user
  belongs_to :role
end
