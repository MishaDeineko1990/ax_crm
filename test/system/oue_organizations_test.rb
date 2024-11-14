require "application_system_test_case"

class OueOrganizationsTest < ApplicationSystemTestCase
  setup do
    @oue_organization = oue_organizations(:one)
  end

  test "visiting the index" do
    visit oue_organizations_url
    assert_selector "h1", text: "Oue organizations"
  end

  test "should create oue organization" do
    visit oue_organizations_url
    click_on "New oue organization"

    fill_in "Ederpou", with: @oue_organization.ederpou
    fill_in "Factic address", with: @oue_organization.factic_address
    fill_in "Ipn", with: @oue_organization.ipn
    fill_in "Legal address", with: @oue_organization.legal_address
    fill_in "Mail", with: @oue_organization.mail
    fill_in "Mfo", with: @oue_organization.mfo
    fill_in "Name", with: @oue_organization.name
    fill_in "Name and requisites bank", with: @oue_organization.name_and_requisites_bank
    fill_in "Number count bank", with: @oue_organization.number_count_bank
    fill_in "Phone", with: @oue_organization.phone
    fill_in "Send address", with: @oue_organization.send_adress
    fill_in "Short name", with: @oue_organization.short_name
    fill_in "Type rent", with: @oue_organization.type_rent
    click_on "Create Oue organization"

    assert_text "Oue organization was successfully created"
    click_on "Back"
  end

  test "should update Oue organization" do
    visit oue_organization_url(@oue_organization)
    click_on "Edit this oue organization", match: :first

    fill_in "Ederpou", with: @oue_organization.ederpou
    fill_in "Factic address", with: @oue_organization.factic_address
    fill_in "Ipn", with: @oue_organization.ipn
    fill_in "Legal address", with: @oue_organization.legal_address
    fill_in "Mail", with: @oue_organization.mail
    fill_in "Mfo", with: @oue_organization.mfo
    fill_in "Name", with: @oue_organization.name
    fill_in "Name and requisites bank", with: @oue_organization.name_and_requisites_bank
    fill_in "Number count bank", with: @oue_organization.number_count_bank
    fill_in "Phone", with: @oue_organization.phone
    fill_in "Send address", with: @oue_organization.send_adress
    fill_in "Short name", with: @oue_organization.short_name
    fill_in "Type rent", with: @oue_organization.type_rent
    click_on "Update Oue organization"

    assert_text "Oue organization was successfully updated"
    click_on "Back"
  end

  test "should destroy Oue organization" do
    visit oue_organization_url(@oue_organization)
    click_on "Destroy this oue organization", match: :first

    assert_text "Oue organization was successfully destroyed"
  end
end
