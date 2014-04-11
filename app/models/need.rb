class Need < ActiveRecord::Base
  belongs_to :organization
  has_many :transactions


  
  def donor
  end
end
