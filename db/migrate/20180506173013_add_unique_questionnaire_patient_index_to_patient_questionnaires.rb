class AddUniqueQuestionnairePatientIndexToPatientQuestionnaires < ActiveRecord::Migration[5.0]
  def change
    add_index :patient_questionnaires, [:patient_id, :questionnaire_id], unique: true
  end
end
