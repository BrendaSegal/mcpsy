require 'test_helper'

class PatientQuestionnaireTest < ActiveSupport::TestCase
  test "only one questionnaire of a given type can be assigned to a patient" do
    toddler_feeding = questionnaires(:toddler_feeding)
    roo = patients(:roo)

    assert roo.questionnaires.push(toddler_feeding)
    
    assert_raises ActiveRecord::RecordInvalid do
      roo.questionnaires.push(toddler_feeding)
    end
  end
end
