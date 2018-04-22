require 'test_helper'

class CaregiverTest < ActiveSupport::TestCase
  test "creating a new Caregiver" do
    assert_difference 'Caregiver.count', 1 do
      Caregiver.create!(
        email: 'brenda@test.com'
      )
    end
  end

  test "email, postal code, phone number format validation works" do
    caregiver = Caregiver.new(
      email: 'brenda',
      house_phone: '123',
      mobile_phone: 'sflasfd',
      work_phone: 'asdfs',
      postal_code: 'H3M-282'
    )

    assert_no_difference 'Caregiver.count' do
      caregiver.save
    end

    refute_empty caregiver.errors

    [:email, :house_phone, :mobile_phone, :work_phone, :postal_code].each do |attrib|
      assert_includes caregiver.errors.messages[attrib], "is invalid"
    end

    caregiver.email = 'b@t.com'
    caregiver.house_phone = '514-222-3333'
    caregiver.mobile_phone = '5145214244'
    caregiver.work_phone = '514-222-1321'
    caregiver.postal_code = 'h4m 2c9'

    assert_difference 'Caregiver.count', 1 do
      caregiver.save!
    end
  end

  test "new Caregiver can't use existing email address" do
    caregiver = Caregiver.new(email: 'wilma@bedrock.com')

    assert_no_difference 'Caregiver.count' do
      caregiver.save
    end

    assert_includes caregiver.errors.messages[:email], "has already been taken"
  end

  test "Caregiver must have an email present" do
    caregiver = Caregiver.new

    assert_no_difference 'Caregiver.count' do
      caregiver.save
    end

    assert_includes caregiver.errors.messages[:email], "can't be blank"
  end

  test "Caregiver postal code is formatted to remove spaces, and set to lowercase" do
    wilma = caregivers(:wilma)
    wilma.postal_code = 'H4M 2B8'
    wilma.save

    assert_equal 'h4m2b8', wilma.postal_code
  end
end
