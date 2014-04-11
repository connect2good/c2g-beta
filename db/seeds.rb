require Rails.root.join('spec', 'support', 'blueprints')
require 'faker'

%w(buyer seller beneficiary donor).each do |role|
  Role.create name: role
end

Organization.make!(5).each do |organization|
  need = Need.make
  need.organization_id = organization.id
  need.save!
end

# Individual.make!(5)



# Market Transactions
# Marketplace.make!(5).each do |transaction|
#   # beneficiary
#   tur = TransactionUserRole.make!(:beneficiary)
#   tur.user = User.make!
#   tur.transaction = transaction
#   tur.role = Role.beneficiary
#   tur.save!

#   # seller
#   tur = TransactionUserRole.make!(:seller)
#   tur.user = User.make!
#   tur.transaction = transaction
#   tur.role = Role.seller
#   tur.save!

#   # buyer
#   tur = TransactionUserRole.make!(:buyer)
#   tur.user = User.make!
#   tur.transaction = transaction
#   tur.role = Role.buyer
#   tur.save!

#   transaction.merchandise =  Merchandise.make!
#   transaction.save!
# end


# Donation Transactions
Donation.make!(5).each do |transaction|
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

  # transaction.need =  Need.make!
  # transaction.save!
end
