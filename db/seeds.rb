require Rails.root.join('spec', 'support', 'blueprints')
require 'faker'

%w(buyer seller beneficiary donor).each do |role|
  Role.create name: role
end

