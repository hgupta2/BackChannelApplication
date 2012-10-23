require 'integration_test'

class UserTest < ActionDispatch::IntegrationTest

  test "login" do
    https!
    get "/"
    signin("sneh", "random")
    assert_response :success
  end

  test "login and logout" do
    signin("sneh", "random")
    assert_redirected_to(:controller => "posts", :action => "index")
    logout
    assert_redirected_to(:action => 'login')
    click_link_or_button('New Post')

  end

  test "create post" do
    signin("sneh", "random")
    assert_redirected_to(:controller => "posts", :action => "index")
    click_link_or_button('New Post')
    fill_in 'Title', :with => "new title"
    fill_in 'Description', :with => "description"
    click_link_or_button('Create Post')
    assert_redirected_to(:controller => "posts", :action => "index")
  end

  test "reply to a post" do
    signin("sneh", "random")
    assert_redirected_to(:controller => "posts", :action => "index")
    click_link_or_button('New Post')
    fill_in 'Title', :with => "new title"
    fill_in 'Description', :with => "description"
    click_link_or_button('Create Post')
    assert_redirected_to(:controller => "posts", :action => "index")

    post = Post.last.id

    click_link_or_button('Comment')
    fill_in 'Comment', :with => "new comment"
    click_link_or_button('Update Post')
  end

end