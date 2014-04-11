class TransactionUserRole < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :organization
  belongs_to :individual
  belongs_to :role

end
