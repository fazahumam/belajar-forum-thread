require 'test_helper'

class ForumPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get forum_posts_new_url
    assert_response :success
  end

end
