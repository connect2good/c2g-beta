class Inquiry < ActiveRecord::Base
  belongs_to :merchandise
  belongs_to :individual
end
