require "application_system_test_case"

class GoodsTest < ApplicationSystemTestCase
  setup do
    @good = goods(:one)
  end

  test "visiting the index" do
    visit goods_url
    assert_selector "h1", text: "Goods"
  end

  test "should create good" do
    visit goods_url
    click_on "New good"

    fill_in "Custom data", with: @good.custom_data
    fill_in "Description", with: @good.description
    fill_in "Height", with: @good.height
    fill_in "Image", with: @good.image
    fill_in "Length", with: @good.length
    fill_in "Name", with: @good.name
    fill_in "Other data", with: @good.other_data
    fill_in "Price", with: @good.price
    fill_in "Tags", with: @good.tags
    fill_in "Weight", with: @good.weight
    fill_in "Width", with: @good.width
    click_on "Create Good"

    assert_text "Good was successfully created"
    click_on "Back"
  end

  test "should update Good" do
    visit good_url(@good)
    click_on "Edit this good", match: :first

    fill_in "Custom data", with: @good.custom_data
    fill_in "Description", with: @good.description
    fill_in "Height", with: @good.height
    fill_in "Image", with: @good.image
    fill_in "Length", with: @good.length
    fill_in "Name", with: @good.name
    fill_in "Other data", with: @good.other_data
    fill_in "Price", with: @good.price
    fill_in "Tags", with: @good.tags
    fill_in "Weight", with: @good.weight
    fill_in "Width", with: @good.width
    click_on "Update Good"

    assert_text "Good was successfully updated"
    click_on "Back"
  end

  test "should destroy Good" do
    visit good_url(@good)
    click_on "Destroy this good", match: :first

    assert_text "Good was successfully destroyed"
  end
end
