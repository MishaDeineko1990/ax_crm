require "application_system_test_case"

class SaleOrganizationsTest < ApplicationSystemTestCase
  setup do
    @sale_organization = sale_organizations(:one)
  end

  test "visiting the index" do
    visit sale_organizations_url
    assert_selector "h1", text: "Sale organizations"
  end

  test "should create sale organization" do
    visit sale_organizations_url
    click_on "New sale organization"

    fill_in "Ederpou", with: @sale_organization.ederpou
    fill_in "Factic address", with: @sale_organization.factic_address
    fill_in "Ipn", with: @sale_organization.ipn
    fill_in "Legal address", with: @sale_organization.legal_address
    fill_in "Mail", with: @sale_organization.mail
    fill_in "Mfo", with: @sale_organization.mfo
    fill_in "Name", with: @sale_organization.name
    fill_in "Name and requisites bank", with: @sale_organization.name_and_requisites_bank
    fill_in "Number count bank", with: @sale_organization.number_count_bank
    fill_in "Phone", with: @sale_organization.phone
    fill_in "Send address", with: @sale_organization.send_adress
    fill_in "Short name", with: @sale_organization.short_name
    fill_in "Type rent", with: @sale_organization.type_rent
    click_on "Create Sale organization"

    assert_text "Sale organization was successfully created"
    click_on "Back"
  end

  test "should update Sale organization" do
    visit sale_organization_url(@sale_organization)
    click_on "Edit this sale organization", match: :first

    fill_in "Ederpou", with: @sale_organization.ederpou
    fill_in "Factic address", with: @sale_organization.factic_address
    fill_in "Ipn", with: @sale_organization.ipn
    fill_in "Legal address", with: @sale_organization.legal_address
    fill_in "Mail", with: @sale_organization.mail
    fill_in "Mfo", with: @sale_organization.mfo
    fill_in "Name", with: @sale_organization.name
    fill_in "Name and requisites bank", with: @sale_organization.name_and_requisites_bank
    fill_in "Number count bank", with: @sale_organization.number_count_bank
    fill_in "Phone", with: @sale_organization.phone
    fill_in "Send address", with: @sale_organization.send_adress
    fill_in "Short name", with: @sale_organization.short_name
    fill_in "Type rent", with: @sale_organization.type_rent
    click_on "Update Sale organization"

    assert_text "Sale organization was successfully updated"
    click_on "Back"
  end

  test "should destroy Sale organization" do
    visit sale_organization_url(@sale_organization)
    click_on "Destroy this sale organization", match: :first

    assert_text "Sale organization was successfully destroyed"
  end
end
