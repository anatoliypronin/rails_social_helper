require 'test_helper'

class Admin::CompaniesControllerTest < ActionDispatch::IntegrationTest
    test 'should get index companies' do
        create :company

        get admin_companies_path
        assert_response :success

    end
end