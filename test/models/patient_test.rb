require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  test "Patient must have a first_name, last_name and an assigned caregiver" do
    patient = Patient.new

    assert_no_difference 'Patient.count' do
      patient.save
    end

    [:first_name, :last_name, :caregiver].each do |attribute|
      assert_includes patient.errors.messages[attribute], "can't be blank"
    end
  end

  test "Patient is successfully created" do
    wilma = caregivers(:wilma)
    toddler_age_group = age_groups(:toddler)

    assert_difference 'Patient.count', 1 do
      Patient.create!(
        first_name: 'Bambam',
        last_name: 'Rubble',
        age_group: @toddler_age_group,
        caregiver: wilma
      )
    end
  end
end
