class AgeGroup < ActiveRecord::Base
  has_many :patients
  has_many :questionnaires
end
