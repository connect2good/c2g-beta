class Merchandise < ActiveRecord::Base
  has_many :offers,
    class_name: 'Purchase',
    foreign_key: 'merchandise_id'

  belongs_to :beneficiary,
    class_name: 'Organization',
    foreign_key: 'organization_id'

  belongs_to :seller,
    class_name: 'Individual',
    foreign_key: 'individual_id'

  has_many :inquiries

  validates :title, presence: :true
  validates :description, presence: :true
  validates :agree, presence: :true
  validates :pic1, presence: :true

  mount_uploader :pic1, ImageUploader
  mount_uploader :pic2, ImageUploader
  mount_uploader :pic3, ImageUploader

  include PgSearch
  pg_search_scope :search, against: [:title, :description],
    using: {tsearch: {dictionary: "english"}}
      # associated_against: {organization: [:name]}
  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

end
