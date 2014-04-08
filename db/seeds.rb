require Rails.root.join('spec', 'support', 'blueprints')
require 'awesome_print'
require 'faker'
require 'yaml'


def make_admin( name, email )
  user = User.make
  user.name  = "Joshua Vaughan"
  user.email = "josh.connect2good@gmail.com"
  user.admin = true
  user.save
end

users = [
  {
    name: "Joshua Vaughan",
    email: "josh.connect2good@gmail.com"
  },

  {
    name: "Sonny Gonzalez",
    email: "sonnyg.email@gmail.com"
  },

  {
    name: "Tyler Wasden",
    email: "twasden@gmail.com"
  },

  {
    name: "Jesse Brandenburg",
    email: "jesselbrandenburg@gmail.com"
  },

  {
    name: "Jeff Conner",
    email: "drumwagon@gmail.com"
  }
]

users.each do |user_info|
  user = User.make
  user.name = user_info[:name]
  user.email = user_info[:email]
  user.admin = true
  user.save
  # ap user_info
end

organizations = YAML.load_file(
  Rails.root.join('spec', 'support', 'launch-seeds.yml')
)

organizations.each do |o|
  organization = Organization.make
  organization.name =        o['name']
  organization.description = o['about']
  organization.email =       o['email']
  organization.image = Rack::Test::UploadedFile.new(
    Rails.root.join(
      'spec', 'support', 'austin-skyline-small.jpg'),
      'image/jpg'
    )
  organization.save!(validate: false)

  o['needs'].each do |n|
    need = Need.make
    need.description = n
    need.organization = organization
    need.save!(validate: false)
  end
end
