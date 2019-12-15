require 'test_helper'

class CabsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cabs_index_url
    assert_response :success
  end

end
