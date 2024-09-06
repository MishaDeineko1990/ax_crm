require "test_helper"

class PerssonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @persson = perssons(:one)
  end

  test "should get index" do
    get perssons_url
    assert_response :success
  end

  test "should get new" do
    get new_persson_url
    assert_response :success
  end

  test "should create persson" do
    assert_difference("Persson.count") do
      post perssons_url, params: { persson: { birth_data: @persson.birth_data, email: @persson.email, father_nane: @persson.father_nane, first_name: @persson.first_name, last_name: @persson.last_name, name_for_contract: @persson.name_for_contract, note_data: @persson.note_data, other_data: @persson.other_data, phone: @persson.phone, role: @persson.role, send_adress: @persson.send_adress } }
    end

    assert_redirected_to persson_url(Persson.last)
  end

  test "should show persson" do
    get persson_url(@persson)
    assert_response :success
  end

  test "should get edit" do
    get edit_persson_url(@persson)
    assert_response :success
  end

  test "should update persson" do
    patch persson_url(@persson), params: { persson: { birth_data: @persson.birth_data, email: @persson.email, father_nane: @persson.father_nane, first_name: @persson.first_name, last_name: @persson.last_name, name_for_contract: @persson.name_for_contract, note_data: @persson.note_data, other_data: @persson.other_data, phone: @persson.phone, role: @persson.role, send_adress: @persson.send_adress } }
    assert_redirected_to persson_url(@persson)
  end

  test "should destroy persson" do
    assert_difference("Persson.count", -1) do
      delete persson_url(@persson)
    end

    assert_redirected_to perssons_url
  end
end
