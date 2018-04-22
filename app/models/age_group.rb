class AgeGroup < ActiveRecord::Base
  has_many :patients
  has_many :questionnaires

  validates :name, presence: true, uniqueness: true
end
