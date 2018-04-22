require 'test_helper'

class QuestionnaireResponseTest < ActiveSupport::TestCase
  test "QuestionnaireResponse must have a patient, questionnaire, date, response" do
    questionnaire_response = QuestionnaireResponse.new

    assert_no_difference 'QuestionnaireResponse.count' do
      questionnaire_response.save
    end

    [:patient, :questionnaire, :date, :response].each do |attribute|
      assert_includes questionnaire_response.errors.messages[attribute], "can't be blank"
    end
  end

  test "Creating a new QuestionnaireResponse" do
    roo = patients(:roo)
    toddler_sleeping = questionnaires(:toddler_sleeping)

    assert 'QuestionnaireResponse.count', 1 do
      QuestionnaireResponse.create!(
        patient: roo,
        questionnaire: toddler_sleeping,
        date: Time.now.utc,
        response: { a: 'b', c: 'd'}.to_json
      )
    end
  end
end
