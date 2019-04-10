require 'test_helper'

class Intervention1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intervention1 = intervention1s(:one)
  end

  test "should get index" do
    get intervention1s_url
    assert_response :success
  end

  test "should get new" do
    get new_intervention1_url
    assert_response :success
  end

  test "should create intervention1" do
    assert_difference('Intervention1.count') do
      post intervention1s_url, params: { intervention1: {  } }
    end

    assert_redirected_to intervention1_url(Intervention1.last)
  end

  test "should show intervention1" do
    get intervention1_url(@intervention1)
    assert_response :success
  end

  test "should get edit" do
    get edit_intervention1_url(@intervention1)
    assert_response :success
  end

  test "should update intervention1" do
    patch intervention1_url(@intervention1), params: { intervention1: {  } }
    assert_redirected_to intervention1_url(@intervention1)
  end

  test "should destroy intervention1" do
    assert_difference('Intervention1.count', -1) do
      delete intervention1_url(@intervention1)
    end

    assert_redirected_to intervention1s_url
  end
end
