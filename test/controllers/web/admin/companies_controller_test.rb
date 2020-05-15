# frozen_string_literal: true

require 'test_helper'

class Web::Admin::CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = create :company
    admin = create :admin
    sign_in_as_admin(admin)
  end

  test 'should get index companies' do
    get admin_companies_path
    assert_response :success
  end

  test 'should get new company page' do
    get new_admin_company_path
    assert_response :success
  end

  test 'should post create company' do
    company_attrs = attributes_for(:company)
    company_attrs[:service_id] = @company.service_id
    company_attrs[:district_id] = @company.district_id

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
    get admin_company_path(@company.id)
    assert_response :success
  end

  test 'should get edit company page' do
    get edit_admin_company_path(@company.id)
    assert_response :success
  end

  test 'should put update сompany' do
    attrs = {}
    attrs[:name] = generate :name
    attrs[:password] = '1234567890'

    put admin_company_path(@company.id), params: { company: attrs }
    assert_response :redirect

    @company.reload
    assert_equal attrs[:name], @company.name
  end

  test 'should state del company' do
    put admin_company_del_path(@company.id)
    assert_response :redirect
    @company.reload
    assert_equal 'deleted', @company.state
  end

  test 'should state active company' do
    @company.del!
    put admin_company_restore_path(@company.id)
    assert_response :redirect

    @company.reload
    assert_equal 'active', @company.state
  end
end
