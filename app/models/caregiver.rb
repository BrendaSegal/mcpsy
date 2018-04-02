class Caregiver < ActiveRecord::Base
  has_many :patients
end
