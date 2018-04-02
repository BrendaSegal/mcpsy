class Patient < ActiveRecord::Base
  belongs_to :caregiver
  belongs_to :age_group
  has_many :questionnaires, through :patient_questionnaires
end
