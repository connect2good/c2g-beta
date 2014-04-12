class Need < ActiveRecord::Base
  belongs_to :organization
  has_many :donations

  include PgSearch
  pg_search_scope :search, against: [:title, :description], 
    using: {tsearch: {dictionary: "english"}}, 
    associated_against: {organization: [:name]}
  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

end
