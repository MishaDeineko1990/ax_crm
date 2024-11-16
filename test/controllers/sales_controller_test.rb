require "test_helper"

class SalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sale = sales(:one)
  end

  test "should get index" do
    get sales_url
    assert_response :success
  end

  test "should get new" do
    get new_sale_url
    assert_response :success
  end

  test "should create sale" do
    assert_difference("Sale.count") do
      post sales_url, params: { sale: { note: @sale.note, organization_id: @sale.organization_id, other_data: @sale.other_data, oue_organization_id: @sale.oue_organization_id, persson_id: @sale.persson_id, status: @sale.status, user_id: @sale.user_id } }
    end

    assert_redirected_to sale_url(Sale.last)
  end

  test "should show sale" do
    get sale_url(@sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_sale_url(@sale)
    assert_response :success
  end

  test "should update sale" do
    patch sale_url(@sale), params: { sale: { note: @sale.note, organization_id: @sale.organization_id, other_data: @sale.other_data, oue_organization_id: @sale.oue_organization_id, persson_id: @sale.persson_id, status: @sale.status, user_id: @sale.user_id } }
    assert_redirected_to sale_url(@sale)
  end

  test "should destroy sale" do
    assert_difference("Sale.count", -1) do
      delete sale_url(@sale)
    end

    assert_redirected_to sales_url
  end
end
