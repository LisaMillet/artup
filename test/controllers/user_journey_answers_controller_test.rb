require "test_helper"

class UserJourneyAnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_journey_answers_create_url
    assert_response :success
  end
end
