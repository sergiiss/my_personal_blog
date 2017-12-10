require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'posts/index'
    assert_select "a[href=?]", new_post_path
  end
end
