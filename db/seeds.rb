require Rails.root.join('spec', 'support', 'blueprints')
require 'faker'

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
    { name: 'Sonny', email: 'sonny@c2g.com' },
    { name: 'Todd',  email: 'todd@c2g.com'  },
    { name: 'Matt',  email: 'matt@c2g.com'  },
    { name: 'Bill',  email: 'bill@c2g.com'  },
  ]
end

# Parameters
PASSWORD                     = 'test1234'
N_INDIVIDUALS                = 3
N_ORGANIZATIONS              = 3
N_NEEDS_PER_ORGANIZATION     = 3
N_MERCHANDISE_PER_INDIVIDUAL = 3


puts 'Creating Organizations with Needs...'
# Create Organizatons with Needs
Organization.make!(N_ORGANIZATIONS).each do |organization|
  Need.make(N_NEEDS_PER_ORGANIZATION).each do |need|
    need.organization_id = organization.id
    need.save! validate: false
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
  Merchandise.make(N_MERCHANDISE_PER_INDIVIDUAL).each do |merchandise|
    merchandise.individual_id   = individual.id
    merchandise.organization_id = Organization.all.sample.id
    merchandise.save! validate: false
  end
end

puts 'Creating Individuals with Merchandise...'
# Create Individuals with sale_itmes
Individual.make!(N_INDIVIDUALS).each do |individual|
  Merchandise.make(N_MERCHANDISE_PER_INDIVIDUAL).each do |merchandise|
    merchandise.individual_id = individual.id
    merchandise.organization_id = Organization.all.sample.id
    merchandise.save! validate: false
  end
end

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
Purchase.make!(5).each do |purchase|
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

# # Donation Transaction
# Donation.make!(5).each do |donation|
#   # need
#   need = Need.all.sample
#   donation.need_id = need.id

#   # beneficiary
#   beneficiary = need.organization

#   # donor
#   donor = Individual.all.sample

#   donation.donor = donor

#   donation.save! validate: false
# end

puts "Seeds complete."
