require 'test_helper'

class CityTest < ActiveSupport::TestCase
  test 'Should create city' do
    city = build :city
    assert city.save
  end

  test 'Should not create city without name' do
    city = build :city, name: nil
    assert_not city.save
  end

  test 'Should not create city with short name' do
    city = build :city, name: 'q'
    assert_not city.save
  end

  test 'Should create city with long name' do
    city = build :city, name: 'veeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeery long name'
    assert_not city.save
  end
end
