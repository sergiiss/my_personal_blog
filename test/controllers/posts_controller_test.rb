require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path

    assert_response :success

    assert_select "h1", "List of posts"
  end

  test "should get new" do
    get new_post_path

    assert_response :success

    assert_select "form input", 3
  end

  test "should get show" do
    post = Post.first

    get post_path(post)

    if post.nil?
      assert_response :missing
    else
      assert_response :success

      assert_select "div", 7
    end
  end
end
