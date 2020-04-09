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
end
