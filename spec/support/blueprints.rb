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
