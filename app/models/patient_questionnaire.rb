class PatientQuestionnaire < ActiveRecord::Base
  belongs_to :patient
  belongs_to :questionnaire
end
