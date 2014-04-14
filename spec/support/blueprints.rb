require 'machinist/active_record'
require 'faker'


Organization.blueprint do
  name     { Faker::Company.name }
  email    { Faker::Internet::email }
  password { 'test1234' }
  password_confirmation do
    object.password
  end
end

Individual.blueprint do
  name     { Faker::Name.name }
  email    { Faker::Internet::email }
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

Purchase.blueprint do
  status  { %w[pending accepted declined].sample }
  closed_at do
    (1 + rand(3)).to_i.days.ago
  agree       { [ true, false ].sample }
  end
end

Donation.blueprint do
  status  { %w[pending accepted declined].sample }
  closed_at do
    (1 + rand(3)).to_i.days.ago
  end
end

Need.blueprint do
  title       { Faker::Company::bs }
  description { Faker::Company::bs }
end

Merchandise.blueprint do
  title       { Faker::Company::bs }
  description { Faker::Company::bs }
  agree       { [ true, false ].sample }
  pic1 do
    Rack::Test::UploadedFile.new(
      Rails.root.join('spec', 'support', 'austin-skyline-small.jpg'),
      'image/jpg'
      )
  end
  pic2 do
    Rack::Test::UploadedFile.new(
      Rails.root.join('spec', 'support', 'austin-skyline-small.jpg'),
      'image/jpg'
      )
  end
  pic3 do
    Rack::Test::UploadedFile.new(
      Rails.root.join('spec', 'support', 'austin-skyline-small.jpg'),
      'image/jpg'
      )
  end
end



