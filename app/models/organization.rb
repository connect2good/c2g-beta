class Organization < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :needs
  
  has_many :benefits,
    class_name: 'Merchandise',
    foreign_key: 'organization_id'

  #would be good to search all merchandise associated with an organization
  
  include PgSearch
  pg_search_scope :search, against: [:name], 
    using: {tsearch: {dictionary: "english"}}
      # associated_against: {merchandise: [:title, :description]}
  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

end
