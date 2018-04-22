class PatientQuestionnaire < ActiveRecord::Base
  belongs_to :patient
  belongs_to :questionnaire

  validates :patient, :questionnaire, presence: true
  validate :patient_questionnaire_unique

  private

  def patient_questionnaire_unique
    if patient.questionnaires.find_by(id: questionnaire.id)
      errors.add(:patient, "has already been assigned questionnaire #{questionnaire.name}")
    end
  end
end
