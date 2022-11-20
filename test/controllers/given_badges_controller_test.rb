require "test_helper"

class GivenBadgesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get given_badges_index_url
    assert_response :success
  end
end
