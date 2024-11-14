require "application_system_test_case"

class OrganizationsTest < ApplicationSystemTestCase
  setup do
    @organization = organizations(:one)
  end

  test "visiting the index" do
    visit organizations_url
    assert_selector "h1", text: "Organizations"
  end

  test "should create organization" do
    visit organizations_url
    click_on "New organization"

    fill_in "Ederpou", with: @organization.ederpou
    fill_in "Factic address", with: @organization.factic_address
    fill_in "Ipn", with: @organization.ipn
    fill_in "Legal address", with: @organization.legal_address
    fill_in "Mail", with: @organization.mail
    fill_in "Mfo", with: @organization.mfo
    fill_in "Name", with: @organization.name
    fill_in "Name and requisites bank", with: @organization.name_and_requisites_bank
    fill_in "Number count bank", with: @organization.number_count_bank
    fill_in "Phone", with: @organization.phone
    fill_in "Send address", with: @organization.send_adress
    fill_in "Short name", with: @organization.short_name
    fill_in "Type rent", with: @organization.type_rent
    click_on "Create Organization"

    assert_text "Organization was successfully created"
    click_on "Back"
  end

  test "should update Organization" do
    visit organization_url(@organization)
    click_on "Edit this organization", match: :first

    fill_in "Ederpou", with: @organization.ederpou
    fill_in "Factic address", with: @organization.factic_address
    fill_in "Ipn", with: @organization.ipn
    fill_in "Legal address", with: @organization.legal_address
    fill_in "Mail", with: @organization.mail
    fill_in "Mfo", with: @organization.mfo
    fill_in "Name", with: @organization.name
    fill_in "Name and requisites bank", with: @organization.name_and_requisites_bank
    fill_in "Number count bank", with: @organization.number_count_bank
    fill_in "Phone", with: @organization.phone
    fill_in "Send address", with: @organization.send_adress
    fill_in "Short name", with: @organization.short_name
    fill_in "Type rent", with: @organization.type_rent
    click_on "Update Organization"

    assert_text "Organization was successfully updated"
    click_on "Back"
  end

  test "should destroy Organization" do
    visit organization_url(@organization)
    click_on "Destroy this organization", match: :first

    assert_text "Organization was successfully destroyed"
  end
end
