require "application_system_test_case"

class SalesTest < ApplicationSystemTestCase
  setup do
    @sale = sales(:one)
  end

  test "visiting the index" do
    visit sales_url
    assert_selector "h1", text: "Sales"
  end

  test "should create sale" do
    visit sales_url
    click_on "New sale"

    fill_in "Note", with: @sale.note
    fill_in "Organization", with: @sale.organization_id
    fill_in "Other data", with: @sale.other_data
    fill_in "Oue organization", with: @sale.oue_organization_id
    fill_in "Persson", with: @sale.persson_id
    fill_in "Status", with: @sale.status
    fill_in "User", with: @sale.user_id
    click_on "Create Sale"

    assert_text "Sale was successfully created"
    click_on "Back"
  end

  test "should update Sale" do
    visit sale_url(@sale)
    click_on "Edit this sale", match: :first

    fill_in "Note", with: @sale.note
    fill_in "Organization", with: @sale.organization_id
    fill_in "Other data", with: @sale.other_data
    fill_in "Oue organization", with: @sale.oue_organization_id
    fill_in "Persson", with: @sale.persson_id
    fill_in "Status", with: @sale.status
    fill_in "User", with: @sale.user_id
    click_on "Update Sale"

    assert_text "Sale was successfully updated"
    click_on "Back"
  end

  test "should destroy Sale" do
    visit sale_url(@sale)
    click_on "Destroy this sale", match: :first

    assert_text "Sale was successfully destroyed"
  end
end
