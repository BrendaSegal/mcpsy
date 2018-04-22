class Patient < ActiveRecord::Base
  belongs_to :caregiver
  belongs_to :age_group
  has_many :patient_questionnaires
  has_many :questionnaires, :through => :patient_questionnaires

  validates :first_name, :last_name, :caregiver, presence: true
end
