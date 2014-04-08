require Rails.root.join('spec', 'support', 'blueprints')
require 'faker'

%w(buyer seller beneficiary donor).each do |role|
  Role.create name: role
end



# Market Transactions
Transaction::Marketplace.make!(5).each do |transaction|
  # beneficiary
  tur = TransactionUserRole.make!(:beneficiary)
  tur.user = User.make!
  tur.transaction = transaction
  tur.role = Role.beneficiary
  tur.save!

  # seller
  tur = TransactionUserRole.make!(:seller)
  tur.user = User.make!
  tur.transaction = transaction
  tur.role = Role.seller
  tur.save!


  # buyer
  tur = TransactionUserRole.make!(:buyer)
  tur.user = User.make!
  tur.transaction = transaction
  tur.role = Role.buyer
  tur.save!

  transaction.good =  Need.make!
  transaction.save!
end


# Donation Transactions
Transaction::Donation.make!(5).each do |transaction|
  # beneficiary
  tur = TransactionUserRole.make!(:beneficiary)
  tur.user = User.make!
  tur.transaction = transaction
  tur.role = Role.beneficiary
  tur.save!

  # donor
  tur = TransactionUserRole.make!(:donor)
  tur.user = User.make!
  tur.transaction = transaction
  tur.role = Role.donor
  tur.save!

  transaction.good =  Merchandise.make!
  transaction.save!
end
