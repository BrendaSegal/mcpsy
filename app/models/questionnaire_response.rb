class QuestionnaireResponse < ActiveRecord::Base
  belongs_to :patient
  belongs_to :questionnaire

  validates :patient, :questionnaire, :date, :response, presence: true
end
