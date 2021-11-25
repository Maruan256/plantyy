require 'test_helper'

class MyGardenControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get my_garden_show_url
    assert_response :success
  end

end
