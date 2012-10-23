require 'integration_test'


class Search  < ActionDispatch::IntegrationTest
  fixtures :all

  test "search content" do
    get('/')
    fill_in("search", :with => "a")
    click_link("search")
    assert page.has_content?("a")
  end

  test "search user" do
    get('/')
    fill_in("search", :with => "sneh0986")
    click_link("search")
    assert page.has_content?("sneh0986")

  end

end