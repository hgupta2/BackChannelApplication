require 'integration_test'


class Vote   < ActionDispatch::IntegrationTest

  fixtures :all
  test "make vote" do
    page.click_link("Login")
    page.fill_in('User name', :with => 'sneh0986')
    page.fill_in('Password', :with => 'random')
    click_button("Login")
    page.click_button('Create Post')
    assert_true page.has_content?('Total Votes: 0')
    page.click_button('Vote')
    page.click_link('Back')
  end

  test "multiples votes" do
    page.click_link("Login")
    page.fill_in('User name', :with => 'sneh0986')
    page.fill_in('Password', :with => 'random')
    click_button("Login")
    assert_true page.has_content?('Total Votes: 0')
    page.click_button('Vote')
    page.click_button('Vote')
    assert_false page.has_content?('Total Vote: 1')
  end

  test "Vote for Comments" do
    page.click_link("Login")
    page.fill_in('User name', :with => 'sneh0986')
    page.fill_in('Password', :with => 'random')
    click_button("Login")
    assert_false page.has_content?("Total Votes: 0")
    find_button("Comment").click
    assert page.has_content?("Total Vote: 1")
  end

end