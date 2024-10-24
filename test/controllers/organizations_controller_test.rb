require "test_helper"

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:one)
  end

  test "should get index" do
    get organizations_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_url
    assert_response :success
  end

  test "should create organization" do
    assert_difference("Organization.count") do
      post organizations_url, params: { organization: { ederpou: @organization.ederpou, factic_address: @organization.factic_address, ipn: @organization.ipn, legal_address: @organization.legal_address, mail: @organization.mail, mfo: @organization.mfo, name: @organization.name, name_and_requisites_bank: @organization.name_and_requisites_bank, number_count_bank: @organization.number_count_bank, phone: @organization.phone, send_address: @organization.send_address, short_name: @organization.short_name, type_rent: @organization.type_rent } }
    end

    assert_redirected_to organization_url(Organization.last)
  end

  test "should show organization" do
    get organization_url(@organization)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_url(@organization)
    assert_response :success
  end

  test "should update organization" do
    patch organization_url(@organization), params: { organization: { ederpou: @organization.ederpou, factic_address: @organization.factic_address, ipn: @organization.ipn, legal_address: @organization.legal_address, mail: @organization.mail, mfo: @organization.mfo, name: @organization.name, name_and_requisites_bank: @organization.name_and_requisites_bank, number_count_bank: @organization.number_count_bank, phone: @organization.phone, send_address: @organization.send_address, short_name: @organization.short_name, type_rent: @organization.type_rent } }
    assert_redirected_to organization_url(@organization)
  end

  test "should destroy organization" do
    assert_difference("Organization.count", -1) do
      delete organization_url(@organization)
    end

    assert_redirected_to organizations_url
  end
end
