require 'test_helper'

class AgeGroupTest < ActiveSupport::TestCase
  test "an age group is created" do
    assert_difference 'AgeGroup.count', 1 do
      AgeGroup.create(
        name: 'adult'
      )
    end
  end

  test "an age group with the same name as an existing record is never created" do
    assert AgeGroup.find_by(name: 'baby')

    assert_no_difference 'AgeGroup.count' do
      AgeGroup.create(
        name: 'baby'
      )
    end
  end
end
