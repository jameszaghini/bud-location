require 'test_helper'

class ApiLocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_locations_create_url
    assert_response :success
  end

end
