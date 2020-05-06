# frozen_string_literal: true

require 'test_helper'

class DistrictTest < ActiveSupport::TestCase
  test 'Should create district' do
    district = build :district
    assert district.save
  end

  test 'Should not create district without name' do
    district = build :district, name: nil
    assert_not district.save
  end

  test 'Should not create district with incorrent name format(left spaces)' do
    district = build :district, name: '     район'
    assert_not district.save
  end

  test 'Should not create district with incorrent name format(between words spaces)' do
    district = build :district, name: 'район       район'
    assert_not district.save
  end

  test 'Should not create district with incorrent name format(right spaces)' do
    district = build :district, name: 'район         '
    assert_not district.save
  end

  test 'Should not create district with short name' do
    district = build :district, name: 'q'
    assert_not district.save
  end

  test 'Should create district with long name' do
    district = build :district, name: 'veeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeery long name'
    assert_not district.save
  end
end
