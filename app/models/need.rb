class Need < ActiveRecord::Base
  belongs_to :organization
  has_many :donations

  def org_name
    Organization.find(need.organization_id).name
  end

end
