require 'machinist/active_record'
require 'faker'

User.blueprint do
  email    { Faker::Internet::email }
  name     { Faker::Name::name }
  password { 'test1234' }
  password_confirmation do
    object.password
  end
end

TransactionUserRole.blueprint do

end

TransactionUserRole.blueprint(:seller) do
  role_id { Role.seller.id }
end

TransactionUserRole.blueprint(:donor) do
  role_id { Role.donor.id }
end

TransactionUserRole.blueprint(:buyer) do
  role_id { Role.buyer.id }
end

TransactionUserRole.blueprint(:beneficiary) do
  role_id { Role.beneficiary.id }
end

Transaction.blueprint do
  status  { %w[pending accepted declined].sample }
  closed_at do
    (1 + rand(3)).to_i.days.ago
  end
end

Transaction::Marketplace.blueprint do
end

Transaction::Donation.blueprint do
end


Good.blueprint do
  description { Faker::Company::bs }
end


Need.blueprint do
end

Merchandise.blueprint do
end



