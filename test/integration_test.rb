require "test_helper"
require "capybara/rails"


module ActionController
  class IntegrationTest
    include Capybara::DSL

    def signup(fname,lname,dateofbirth,username,email,password,passwordconfrm)
      user = User.create(:fname => fname, :lname => lname, :dob => dateofbirth, :username => username, :email => email, :password => password)
      user.save!
    end

    def signin(username, password)
      visit '/'
      click_link_or_button('Log in')
      fill_in 'Username or Email:', :with => username
      fill_in 'Password:', :with => password
      click_link_or_button('Log In')
    end

    def logout
      click_link_or_button('Logout')
    end

  end
end