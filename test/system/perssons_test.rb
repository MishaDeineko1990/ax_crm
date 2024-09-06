require "application_system_test_case"

class PerssonsTest < ApplicationSystemTestCase
  setup do
    @persson = perssons(:one)
  end

  test "visiting the index" do
    visit perssons_url
    assert_selector "h1", text: "Perssons"
  end

  test "should create persson" do
    visit perssons_url
    click_on "New persson"

    fill_in "Birth data", with: @persson.birth_data
    fill_in "Email", with: @persson.email
    fill_in "Father nane", with: @persson.father_nane
    fill_in "First name", with: @persson.first_name
    fill_in "Last name", with: @persson.last_name
    fill_in "Name for contract", with: @persson.name_for_contract
    fill_in "Note data", with: @persson.note_data
    fill_in "Other data", with: @persson.other_data
    fill_in "Phone", with: @persson.phone
    fill_in "Role", with: @persson.role
    fill_in "Send adress", with: @persson.send_adress
    click_on "Create Persson"

    assert_text "Persson was successfully created"
    click_on "Back"
  end

  test "should update Persson" do
    visit persson_url(@persson)
    click_on "Edit this persson", match: :first

    fill_in "Birth data", with: @persson.birth_data
    fill_in "Email", with: @persson.email
    fill_in "Father nane", with: @persson.father_nane
    fill_in "First name", with: @persson.first_name
    fill_in "Last name", with: @persson.last_name
    fill_in "Name for contract", with: @persson.name_for_contract
    fill_in "Note data", with: @persson.note_data
    fill_in "Other data", with: @persson.other_data
    fill_in "Phone", with: @persson.phone
    fill_in "Role", with: @persson.role
    fill_in "Send adress", with: @persson.send_adress
    click_on "Update Persson"

    assert_text "Persson was successfully updated"
    click_on "Back"
  end

  test "should destroy Persson" do
    visit persson_url(@persson)
    click_on "Destroy this persson", match: :first

    assert_text "Persson was successfully destroyed"
  end
end
