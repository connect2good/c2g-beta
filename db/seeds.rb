require Rails.root.join('spec', 'support', 'blueprints')
require 'faker'
require 'yaml'


PASSWORD = 'test1234'

# Parameters
if ENV['RAILS_ENV'] == 'test'
  N_INDIVIDUALS                = 1
  N_ORGANIZATIONS              = 1
  N_NEEDS_PER_ORGANIZATION     = 1
  N_PURCHASES                  = 1
  N_MERCHANDISE_PER_INDIVIDUAL = 1
  N_DONATIONS_PER_DEV          = 1
  N_DONATIONS                  = 1
else
  N_INDIVIDUALS                = 5
  N_ORGANIZATIONS              = 10
  N_NEEDS_PER_ORGANIZATION     = 10
  N_PURCHASES                  = 10
  N_MERCHANDISE_PER_INDIVIDUAL = 5
  N_DONATIONS_PER_DEV          = 5
  N_DONATIONS                  = 10
end


def devs_admins
  # Make Dev Users Admin
  [
    { name: 'Sonny', email: 'sonny.admin@c2g.com' },
    { name: 'Todd',  email: 'todd.admin@c2g.com'  },
    { name: 'Matt',  email: 'matt.admin@c2g.com ' },
    { name: 'Bill',  email: 'bill.admin@c2g.com'  },
  ]
end

def devs_not_admin
  # Make Dev Users !Admin
  [
    { name: 'Sonny', email: 'sonnyg.email@gmail.com'   },
    { name: 'Todd',  email: 'twac05@yahoo.com'         },
    { name: 'Matt',  email: 'mattdenton.dev@gmail.com' },
    { name: 'Bill',  email: 'billfienberg@gmail.com'   },
  ]
end

# Create Organizatons with Needs
puts 'Creating Organizations with Needs...'
organizations = YAML.load_file(
  Rails.root.join('spec', 'support', 'beta-seeds.yml')
)

organizations.each do |organization|
  # ap organization
  org = Organization.make!(
    name:    organization['name'],
    email:   organization['email'] || Faker::Internet::email,
    about:   organization['about'],
    website: organization['website']
  )
  ap organization['needs']
  organization['needs'].each do |need|
    Need.make!(
      title: need.truncate(20, separator: ' '),
      description: need,
      organization_id: org.id
    )
  end
end

puts 'Creating Devs(Admin)...'
# Make Dev Admins
devs_admins.each do |admin|
  individual = Individual.make(
    name:     admin[:name],
    email:    admin[:email],
    password: PASSWORD,
    password_confirmation: PASSWORD,
    admin:    true
  )
  individual.save! validate: false
end


puts 'Creating Devs(!Admin) with Merchandise...'
# Make Devs !Admin
devs_not_admin.each do |dev|
  individual = Individual.make(
    name:     dev[:name],
    email:    dev[:email],
    password: PASSWORD,
    password_confirmation: PASSWORD
  )

  individual.save! validate: false

  # Give Dev !Admins some merchandise
  # Merchandise.make(N_MERCHANDISE_PER_INDIVIDUAL).each do |merchandise|
  #   merchandise.individual_id   = individual.id
  #   merchandise.organization_id = Organization.all.sample.id
  #   merchandise.save! validate: false
  # end
end

puts 'Creating Individuals with Merchandise...'
# Create Individuals with sale_itmes

# mansion
person = Individual.make!
Merchandise.make!(
  title: 'Cozy Hamptons Cottage',
  description: '12,000 square feet with 14 bedrooms, 8 full baths on 10 acres. Beautiful view. Priced to sell',
  pic1:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'mansion.jpg'),
    'image/jpg'
    ),
  pic2:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'mansion.jpg'),
    'image/jpg'
    ),
  pic3:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'mansion.jpg'),
    'image/jpg'
    ),
  price: 14.5e6,
  donation_percent: 20,
  individual_id: person.id,
  organization_id: Organization.all.sample.id
)

# yacht
person = Individual.make!
Merchandise.make!(
  title: 'Weekend Yacht',
  description: '150 foot yacht complete with 3 state rooms, a galley, and home theater system with B&W speakers',
  pic1:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'yacht.jpg'),
    'image/jpg'
    ),
  pic2:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'yacht.jpg'),
    'image/jpg'
    ),
  pic3:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'yacht.jpg'),
    'image/jpg'
    ),
  price: 3.2e6,
  donation_percent: 10,
  individual_id: person.id,
  organization_id: Organization.all.sample.id
)

# fridge
person = Individual.make!
Merchandise.make!(
  title: 'Shiny, Happy Fridge',
  description: '2.5 cubic meters of coolness. Includes filtered water dispenser and icemaker. Smudge resistant finish. Great for a household with young children',
  pic1:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'fridge.jpg'),
    'image/jpg'
    ),
  pic2:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'fridge.jpg'),
    'image/jpg'
    ),
  pic3:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'fridge.jpg'),
    'image/jpg'
    ),
  price: 500.00,
  donation_percent: 50,
  individual_id: person.id,
  organization_id: Organization.all.sample.id
)


# lawnmower
person = Individual.make!
Merchandise.make!(
  title: 'Riding Lawnmower',
  description: '50 hp of green and yellow awesome sauce. Ride the Deer with a beer. Bring the fun back to mowing your lawn',
  pic1:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'lawnmowver.jpg'),
    'image/jpg'
    ),
  pic2:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'lawnmowver.jpg'),
    'image/jpg'
    ),
  pic3:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'lawnmowver.jpg'),
    'image/jpg'
    ),
  price: 1250.00,
  donation_percent: 25,
  individual_id: person.id,
  organization_id: Organization.all.sample.id
)

# batmobile
person = Individual.make!
Merchandise.make!(
  title: 'The Batmobile',
  description: 'TV\'s original Batmobile. Owner has fallen on hard times. A really, really good deal. Great for impressing your dates.',
  pic1:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'batmobile.jpg'),
    'image/jpg'
    ),
  pic2:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'batmobile.jpg'),
    'image/jpg'
    ),
  pic3:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'batmobile.jpg'),
    'image/jpg'
    ),
  price: 150000.00,
  donation_percent: 5,
  individual_id: person.id,
  organization_id: Organization.all.sample.id
)

# couch
person = Individual.make!
Merchandise.make!(
  title: 'Stylish Couch',
  description: 'Beutiful micro-fiber sitting system. Stain resistant and comfy. Great for Sunday afternoon coding.',
  pic1:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'couch.jpg'),
    'image/jpg'
    ),
  pic2:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'couch.jpg'),
    'image/jpg'
    ),
  pic3:  Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'couch.jpg'),
    'image/jpg'
    ),
  price: 350.00,
  donation_percent: 15,
  individual_id: person.id,
  organization_id: Organization.all.sample.id
)


puts 'Creating Market Transactions for Devs(!Admin)...'
# Market Transactions
devs_not_admin.each do |dev|
  # seller
  seller = Individual.find_by(email: dev[:email])
  seller.sale_items.each do |sale_item|

    purchase = Purchase.make!
      # beneficiary
      beneficiary = Organization.all.sample

      # sale_item
      purchase.sale_item = sale_item

      # buyer
      begin
        buyer = Individual.all.sample
      end until buyer.id != seller.id
      purchase.buyer = buyer

      purchase.save! validate: false
    
  end
end

puts 'Creating Market Transactions for Individuals...'
# Market Transactions
Purchase.make!(N_PURCHASES).each do |purchase|
  # beneficiary
  beneficiary = Organization.all.sample

  # seller
  merchandise = Merchandise.all.sample
  seller      = merchandise.seller

  purchase.sale_item = merchandise

  # buyer
  begin
    buyer = Individual.all.sample
  end until buyer.id != seller.id

  purchase.buyer = buyer
  purchase.save! validate: false
end


puts 'Creating Donations for Devs(!Admin)...'
# Donation Transactions
devs_not_admin.each do |dev|
  # donor
  donor = Individual.find_by(email: dev[:email])

  Donation.make!(N_DONATIONS_PER_DEV).each do |donation|
    # need
    need = Need.all.sample
    donation.need_id = need.id

    # beneficiary
    beneficiary = need.organization

    # donor
    donation.donor = donor

    save = donation.save! validate: false
  end

end

puts 'Creating Donations for Individuals...'
# Donation Transaction
Donation.make!(5).each do |donation|
  # need
  need = Need.all.sample
  donation.need_id = need.id

  # beneficiary
  beneficiary = need.organization

  # donor
  donor = Individual.all.sample

  donation.donor = donor

  donation.save! validate: false
end

puts "Seeds complete."
