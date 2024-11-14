require "test_helper"

class OueOrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oue_organization = oue_organizations(:one)
  end

  test "should get index" do
    get oue_organizations_url
    assert_response :success
  end

  test "should get new" do
    get new_oue_organization_url
    assert_response :success
  end

  test "should create oue_organization" do
    assert_difference("OueOrganization.count") do
      post oue_organizations_url, params: { oue_organization: { ederpou: @oue_organization.ederpou, factic_address: @oue_organization.factic_address, ipn: @oue_organization.ipn, legal_address: @oue_organization.legal_address, mail: @oue_organization.mail, mfo: @oue_organization.mfo, name: @oue_organization.name, name_and_requisites_bank: @oue_organization.name_and_requisites_bank, number_count_bank: @oue_organization.number_count_bank, phone: @oue_organization.phone, send_adress: @oue_organization.send_adress, short_name: @oue_organization.short_name, type_rent: @oue_organization.type_rent } }
    end

    assert_redirected_to oue_organization_url(OueOrganization.last)
  end

  test "should show oue_organization" do
    get oue_organization_url(@oue_organization)
    assert_response :success
  end

  test "should get edit" do
    get edit_oue_organization_url(@oue_organization)
    assert_response :success
  end

  test "should update oue_organization" do
    patch oue_organization_url(@oue_organization), params: { oue_organization: { ederpou: @oue_organization.ederpou, factic_address: @oue_organization.factic_address, ipn: @oue_organization.ipn, legal_address: @oue_organization.legal_address, mail: @oue_organization.mail, mfo: @oue_organization.mfo, name: @oue_organization.name, name_and_requisites_bank: @oue_organization.name_and_requisites_bank, number_count_bank: @oue_organization.number_count_bank, phone: @oue_organization.phone, send_adress: @oue_organization.send_adress, short_name: @oue_organization.short_name, type_rent: @oue_organization.type_rent } }
    assert_redirected_to oue_organization_url(@oue_organization)
  end

  test "should destroy oue_organization" do
    assert_difference("OueOrganization.count", -1) do
      delete oue_organization_url(@oue_organization)
    end

    assert_redirected_to oue_organizations_url
  end
end
