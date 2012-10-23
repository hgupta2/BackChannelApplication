require 'integration_test'

class PostTest  < ActionDispatch::IntegrationTest
  fixtures :all

  test "user post" do
    signin("sneh", "random")
    assert_redirected_to(:controller => "posts", :action => "index")
    click_link_or_button('New Post')
    fill_in 'Title', :with => "new title"
    fill_in 'Description', :with => "description"
    click_link_or_button('Create Post')
    assert page.has_content?("new title")
    assert_true (page.has_content?('Total Votes: 0'))
  end
end