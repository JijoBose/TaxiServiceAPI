require 'test_helper'

class Api::V1::CabsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_cab = api_v1_cabs(:one)
  end

  test "should get index" do
    get api_v1_cabs_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_cab_url
    assert_response :success
  end

  test "should create api_v1_cab" do
    assert_difference('Api::V1::Cab.count') do
      post api_v1_cabs_url, params: { api_v1_cab: {  } }
    end

    assert_redirected_to api_v1_cab_url(Api::V1::Cab.last)
  end

  test "should show api_v1_cab" do
    get api_v1_cab_url(@api_v1_cab)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_cab_url(@api_v1_cab)
    assert_response :success
  end

  test "should update api_v1_cab" do
    patch api_v1_cab_url(@api_v1_cab), params: { api_v1_cab: {  } }
    assert_redirected_to api_v1_cab_url(@api_v1_cab)
  end

  test "should destroy api_v1_cab" do
    assert_difference('Api::V1::Cab.count', -1) do
      delete api_v1_cab_url(@api_v1_cab)
    end

    assert_redirected_to api_v1_cabs_url
  end
end
