require 'test_helper'

class Api::V1::RidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_ride = api_v1_rides(:one)
  end

  test "should get index" do
    get api_v1_rides_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_ride_url
    assert_response :success
  end

  test "should create api_v1_ride" do
    assert_difference('Api::V1::Ride.count') do
      post api_v1_rides_url, params: { api_v1_ride: {  } }
    end

    assert_redirected_to api_v1_ride_url(Api::V1::Ride.last)
  end

  test "should show api_v1_ride" do
    get api_v1_ride_url(@api_v1_ride)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_ride_url(@api_v1_ride)
    assert_response :success
  end

  test "should update api_v1_ride" do
    patch api_v1_ride_url(@api_v1_ride), params: { api_v1_ride: {  } }
    assert_redirected_to api_v1_ride_url(@api_v1_ride)
  end

  test "should destroy api_v1_ride" do
    assert_difference('Api::V1::Ride.count', -1) do
      delete api_v1_ride_url(@api_v1_ride)
    end

    assert_redirected_to api_v1_rides_url
  end
end
