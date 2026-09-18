require "test_helper"

class LandingPageTest < ActionDispatch::IntegrationTest
  test "landing page is accessible without login" do
    get "/"
    follow_redirect! if response.redirect?
    assert_response :success
  end
end
