class CreateQuestionnaireResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaire_responses do |t|
    	t.references :questionnaire, foreign: true, null: false
    	t.references :patient, foreign: true, null: false
    	t.date :date, null: false
    	t.json :response, null: false
    	t.timestamps
    end

    add_index(:questionnaire_responses, [:patient_id, :date], name: 'by_patient_and_date')
  end
end
