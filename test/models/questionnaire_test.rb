require 'test_helper'

class QuestionnaireTest < ActiveSupport::TestCase
  setup do 
    @baby_age_group = age_groups(:baby)
  end

  test "Questionnaire must have a name, file_path, and an assigned age_group" do
    questionnaire = Questionnaire.new

    assert_no_difference 'Questionnaire.count' do
      questionnaire.save
    end

    [:name, :file_path, :age_group].each do |attribute|
      assert_includes questionnaire.errors.messages[attribute], "can't be blank"
    end
  end

  test "Questionnaire must have a unique name/age_group combo" do
    assert Questionnaire.find_by(name: 'sleeping', age_group: @baby_age_group)

    assert_no_difference 'Questionnaire.count' do
      Questionnaire.create(
        age_group: @baby_age_group,
        name: 'sleeping',
        file_path: 'assets/questionnaires/baby/sleeping-2.json'
      )
    end
  end

  test "Questionnaire must have a unique file_path" do
    file_path = 'assets/questionnaires/baby/sleeping.json'
    assert Questionnaire.find_by(file_path: file_path)

    assert_no_difference 'Questionnaire.count' do
      Questionnaire.create(
        age_group: @baby_age_group,
        name: 'babbling',
        file_path: file_path
      )
    end
  end

  test "Questionnaire is successfully created" do
    assert_difference 'Questionnaire.count', 1 do
      Questionnaire.create!(
        age_group: @baby_age_group,
        name: 'babbling',
        file_path: 'assets/questionnaires/baby/babbling.json'
      )
    end
  end
end
