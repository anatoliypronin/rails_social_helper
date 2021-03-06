# frozen_string_literal: true

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
    company1 = build :company, name: 'Name of very big company'
    company2 = build :company, name: 'Name of very big company'
    company1.save
    assert_not company2.save
  end

  test 'Should not create company without city name' do
    company = build :company, city_id: nil
    assert_not company.save
  end

  test 'Should not create company without district name' do
    company = build :company, district: nil
    assert_not company.save
  end

  test 'Should be create company with district and district with city' do
    company = create :company
    assert company.district
    assert company.district.city
  end

  test 'Should not create company without adress' do
    company = build :company, address: nil
    assert_not company.save
  end

  test 'Should not create company with too short adress' do
    company = build :company, address: 'city'
    assert_not company.save
  end

  test 'Should not create company without email_registration' do
    company = build :company, email_registration: nil
    assert_not company.save
  end

  test 'Should not create company with invalid email_registration format' do
    company = build :company, email_registration: 'wrong@email@format.com'
    assert_not company.save
  end

  test 'Should not create company with not unique email_registration' do
    company1 = build :company, email_registration: 'email@mail.ru'
    company2 = build :company, email_registration: 'email@mail.ru'
    company1.save
    assert_not company2.save
  end

  test 'Should not create company without email_notification' do
    company = build :company, email_notification: nil
    assert_not company.save
  end

  test 'Should not create company with invalid email_notification' do
    company = build :company, email_notification: 'wrong@email@format.com'
    assert_not company.save
  end

  test 'Should not create company with not unique email_notification' do
    company1 = build :company, email_notification: 'email@mail.ru'
    company2 = build :company, email_notification: 'email@mail.ru'
    company1.save
    assert_not company2.save
  end

  test 'Should not create company without password' do
    company = build :company, password: nil
    assert_not company.save
  end

  test 'Should not create company with short password' do
    company = build :company, password: 'qwerty'
    assert_not company.save
  end

  test 'Should not create company without phone' do
    company = build :company, phone: 'qwerty'
    assert_not company.save
  end

  test 'Should not create company with invalid phone format' do
    company = build :company, phone: '+123+123+123'
    assert_not company.save
  end

  test 'Should not create company with not unique phone' do
    company1 = build :company, phone: '12345678911'
    company2 = build :company, phone: '12345678911'
    company1.save
    assert_not company2.save
  end

  test 'Should not create company without state' do
    company = build :company, state: nil
    assert_not company.save
  end

  test 'Should not create company with invalid state property' do
    company = build :company, state: 'test'
    assert_not company.save
  end

  test 'Should change company state to deleted' do
    company = create :company
    company.del
    assert_equal 'deleted', company.state
  end
end
