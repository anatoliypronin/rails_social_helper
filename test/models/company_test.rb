require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  
  test 'Should create company' do
    company = build :company
    assert company.save
  end

  test 'Should not create company without name' do
    company = build :company, name: nil
    assert_not company.save
  end

  test 'Should not create company with not unique name' do
    company1 = build :company
    company2 = build :company
    company1.save
    assert_not company2.save
  end

  test 'Should not create company without city name' do
    company = build :company, city: nil
    assert_not company.save
  end

  test 'Should not create company with too long city name' do
    company = build :company, city: 'Nnnnnnnnnnnaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaammmmmmmmmmmmmmmmmmmmmmmmmmeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'
    assert_not company.save
  end

  test 'Should not create company without district name' do
    company = build :company, district: nil
    assert_not company.save
  end

  test 'Should not create company with too long district name' do
    company = build :company, district: 'Nnnnnnnnnnnaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaammmmmmmmmmmmmmmmmmmmmmmmmmeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'
    assert_not company.save
  end

  test 'Should not create company without adress' do
    company = build :company, adress: nil
    assert_not company.save
  end

  test 'Should not create company with too short adress' do
    company = build :company, adress: 'city'
    assert_not company.save
  end
end
