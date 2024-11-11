require "test_helper"

class SaleOrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sale_organization = sale_organizations(:one)
  end

  test "should get index" do
    get sale_organizations_url
    assert_response :success
  end

  test "should get new" do
    get new_sale_organization_url
    assert_response :success
  end

  test "should create sale_organization" do
    assert_difference("SaleOrganization.count") do
      post sale_organizations_url, params: { sale_organization: { ederpou: @sale_organization.ederpou, factic_address: @sale_organization.factic_address, ipn: @sale_organization.ipn, legal_address: @sale_organization.legal_address, mail: @sale_organization.mail, mfo: @sale_organization.mfo, name: @sale_organization.name, name_and_requisites_bank: @sale_organization.name_and_requisites_bank, number_count_bank: @sale_organization.number_count_bank, phone: @sale_organization.phone, send_address: @sale_organization.send_address, short_name: @sale_organization.short_name, type_rent: @sale_organization.type_rent } }
    end

    assert_redirected_to sale_organization_url(SaleOrganization.last)
  end

  test "should show sale_organization" do
    get sale_organization_url(@sale_organization)
    assert_response :success
  end

  test "should get edit" do
    get edit_sale_organization_url(@sale_organization)
    assert_response :success
  end

  test "should update sale_organization" do
    patch sale_organization_url(@sale_organization), params: { sale_organization: { ederpou: @sale_organization.ederpou, factic_address: @sale_organization.factic_address, ipn: @sale_organization.ipn, legal_address: @sale_organization.legal_address, mail: @sale_organization.mail, mfo: @sale_organization.mfo, name: @sale_organization.name, name_and_requisites_bank: @sale_organization.name_and_requisites_bank, number_count_bank: @sale_organization.number_count_bank, phone: @sale_organization.phone, send_address: @sale_organization.send_address, short_name: @sale_organization.short_name, type_rent: @sale_organization.type_rent } }
    assert_redirected_to sale_organization_url(@sale_organization)
  end

  test "should destroy sale_organization" do
    assert_difference("SaleOrganization.count", -1) do
      delete sale_organization_url(@sale_organization)
    end

    assert_redirected_to sale_organizations_url
  end
end
