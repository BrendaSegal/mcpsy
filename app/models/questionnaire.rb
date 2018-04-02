class Questionnaire < ActiveRecord::Base
  belongs_to :age_group
  has_many :patients, through :patient_questionnaires
end
