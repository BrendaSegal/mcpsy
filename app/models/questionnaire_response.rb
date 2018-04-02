class QuestionnaireResponses < ActiveRecord::Base
  belongs_to :patient
  belongs_to :questionnaire
end
