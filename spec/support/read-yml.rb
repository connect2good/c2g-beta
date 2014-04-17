#!/usr/bin/env ruby

require 'awesome_print'
require 'yaml'

organizations = YAML.load_file(
  # Rails.root.join('spec', 'support', 'beta-seeds.yml')
  'beta-seeds.yml'
)

organizations.each do |org|
  ap org['needs']
end