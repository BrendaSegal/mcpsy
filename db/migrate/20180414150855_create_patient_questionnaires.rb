class CreatePatientQuestionnaires < ActiveRecord::Migration[5.0]
  def change
    create_table :patient_questionnaires do |t|
    	t.references :patient, foreign: true, null: false
    	t.references :questionnaire, foreign: true, null: false
    	t.timestamps
    end
  end
end
