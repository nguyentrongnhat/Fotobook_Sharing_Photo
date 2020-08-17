require 'test_helper'

class ReactsControllerTest < ActionDispatch::IntegrationTest
  test "should get photos" do
    get reacts_photos_url
    assert_response :success
  end

end
