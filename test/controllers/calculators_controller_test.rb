require "test_helper"

class CalculatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get screw" do
    get calculators_screw_url
    assert_response :success
  end

  test "should get screw_spiral" do
    get calculators_screw_spiral_url
    assert_response :success
  end

  test "should get screw_conv" do
    get calculators_screw_conv_url
    assert_response :success
  end

  test "should get noria" do
    get calculators_noria_url
    assert_response :success
  end

  test "should get belt_conv" do
    get calculators_belt_conv_url
    assert_response :success
  end

  test "should get chain_conv" do
    get calculators_chain_conv_url
    assert_response :success
  end

  test "should get silo" do
    get calculators_silo_url
    assert_response :success
  end
end
