require "application_system_test_case"

class TovarsTest < ApplicationSystemTestCase
  setup do
    @tovar = tovars(:one)
  end

  test "visiting the index" do
    visit tovars_url
    assert_selector "h1", text: "Tovars"
  end

  test "should create tovar" do
    visit tovars_url
    click_on "New tovar"

    fill_in "Custom data", with: @tovar.custom_data
    fill_in "Description", with: @tovar.description
    fill_in "Height", with: @tovar.height
    fill_in "Image", with: @tovar.image
    fill_in "Length", with: @tovar.length
    fill_in "Name", with: @tovar.name
    fill_in "Other data", with: @tovar.other_data
    fill_in "Price", with: @tovar.price
    fill_in "Tags", with: @tovar.tags
    fill_in "Weight", with: @tovar.weight
    fill_in "Width", with: @tovar.width
    click_on "Create Tovar"

    assert_text "Tovar was successfully created"
    click_on "Back"
  end

  test "should update Tovar" do
    visit tovar_url(@tovar)
    click_on "Edit this tovar", match: :first

    fill_in "Custom data", with: @tovar.custom_data
    fill_in "Description", with: @tovar.description
    fill_in "Height", with: @tovar.height
    fill_in "Image", with: @tovar.image
    fill_in "Length", with: @tovar.length
    fill_in "Name", with: @tovar.name
    fill_in "Other data", with: @tovar.other_data
    fill_in "Price", with: @tovar.price
    fill_in "Tags", with: @tovar.tags
    fill_in "Weight", with: @tovar.weight
    fill_in "Width", with: @tovar.width
    click_on "Update Tovar"

    assert_text "Tovar was successfully updated"
    click_on "Back"
  end

  test "should destroy Tovar" do
    visit tovar_url(@tovar)
    click_on "Destroy this tovar", match: :first

    assert_text "Tovar was successfully destroyed"
  end
end
