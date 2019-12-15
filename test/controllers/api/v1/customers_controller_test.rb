require 'test_helper'

class Api::V1::CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_customer = api_v1_customers(:one)
  end

  test "should get index" do
    get api_v1_customers_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_customer_url
    assert_response :success
  end

  test "should create api_v1_customer" do
    assert_difference('Api::V1::Customer.count') do
      post api_v1_customers_url, params: { api_v1_customer: {  } }
    end

    assert_redirected_to api_v1_customer_url(Api::V1::Customer.last)
  end

  test "should show api_v1_customer" do
    get api_v1_customer_url(@api_v1_customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_customer_url(@api_v1_customer)
    assert_response :success
  end

  test "should update api_v1_customer" do
    patch api_v1_customer_url(@api_v1_customer), params: { api_v1_customer: {  } }
    assert_redirected_to api_v1_customer_url(@api_v1_customer)
  end

  test "should destroy api_v1_customer" do
    assert_difference('Api::V1::Customer.count', -1) do
      delete api_v1_customer_url(@api_v1_customer)
    end

    assert_redirected_to api_v1_customers_url
  end
end
