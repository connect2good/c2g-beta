require Rails.root.join('spec', 'support', 'blueprints')
require 'faker'

%w(buyer seller beneficiary donor).each do |role|
  Role.create name: role
end

Organization.make!(5).each do |organization|
  Need.make(10).each do |need|
    need.organization_id = organization.id
    need.save!
  end
end

Individual.make!(5).each do |individual|
  Merchandise.make(10).each do |merchandise|
    merchandise.individual_id = individual.id
    merchandise.organization_id = Organization.all.sample.id
    merchandise.save!
  end
end



# Market Transactions
Purchase.make!(5).each do |transaction|
  # beneficiary
  tur = TransactionUserRole.make!(:beneficiary)
  tur.user_id = Organization.make!.id
  tur.transaction_id = transaction.id
  tur.role = Role.beneficiary
  tur.save!

  # seller
  tur = TransactionUserRole.make!(:seller)
  tur.user_id = Individual.make!.id
  tur.transaction_id = transaction.id
  tur.role = Role.seller
  tur.save!

  # buyer
  tur = TransactionUserRole.make!(:buyer)
  tur.user_id = Individual.make!.id
  tur.transaction_id = transaction.id
  tur.role = Role.buyer
  tur.save!

  # transaction.merchandise_id =  Merchandise.make!.id
  transaction.save!
end


# Donation Transaction
Donation.make!(5).each do |donation|
  # beneficiary
  tur = TransactionUserRole.make!(:beneficiary)
  tur.user_id = Organization.make!.id
  tur.transaction_id = donation.id
  tur.role = Role.beneficiary
  tur.save!

  # seller
  tur = TransactionUserRole.make!(:seller)
  tur.user_id = Individual.make!.id
  tur.transaction_id = donation.id
  tur.role = Role.seller
  tur.save!

  # buyer
  tur = TransactionUserRole.make!(:buyer)
  tur.user_id = Individual.make!.id
  tur.transaction_id = donation.id
  tur.role = Role.buyer
  tur.save!

  # donation.need_id =  Need.make!.id
  donation.save!
end
