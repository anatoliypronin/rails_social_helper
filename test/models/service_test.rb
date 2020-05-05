require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  test 'Should create service' do
    service = build :service
    assert service.save
  end

  test 'Should not create service without name' do
    service = build :service, name: nil
    assert_not service.save
  end

  test 'Should not create service with not unique name' do
    service1 = build :service, name: 'Name of service'
    service2 = build :service, name: 'Name of service'
    service1.save
    assert_not service2.save
  end

  test 'Should not create service with incorrent name format(between words spaces)' do
    service = build :service, name: 'сервис       сервис'
    assert_not service.save
  end

  test 'Should not create service with incorrent name format(right spaces)' do
    service = build :service, name: 'служба         '
    assert_not service.save
  end

  test 'Should not create service with short name' do
    service = build :service, name: 'ф'
    assert_not service.save
  end

  test 'Should create service with long name' do
    service = build :service, name: 'veeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeery long name'
    assert_not service.save
  end
end