require 'test_helper'

class Admin::CompaniesControllerTest < ActionDispatch::IntegrationTest
    test 'should get index companies' do
        create :company

        get admin_companies_path
        assert_response :success
    end

    test 'should get new company page' do
      get new_admin_company_path
      assert_response :success
    end
  
    test 'should post create company' do
      company_attrs = attributes_for :company
      post admin_companies_path, params: { company: company_attrs }
      assert_response :redirect
  
      company = Company.last
      assert_equal company_attrs[:phone], company.phone
    end
    
    test 'should not post create company' do
      company_attrs = attributes_for :company, name: nil

      post admin_companies_path, params: { company: company_attrs }
      assert_response :success
  
      company = Company.find_by(name: company_attrs[:name])
      assert_nil company
    end

    test 'should get show company page' do
      company = create :company

      get admin_company_path(company.id)
      assert_response :success
    end 
  end