require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not be empty" do
    u=User.new
    assert !u.valid?
  end

  test "should require username" do
    assert_equal "hemant", users(:one).username
  end

  test "should require fname" do
    assert_equal "Hemant", users(:one).fname
  end

  test "should require lname" do
    assert_equal "Gupta", users(:one).lname
  end

  test "should require dob" do
    assert_equal "05/11/1989", users(:one).dob
  end


  test "should require email" do
    assert_equal "hemant@ncsu.edu", users(:one).email
  end

  test "should require salt" do
    assert_equal "$2a$10$jt6gKPOaPLrn/uL8Zk3/ee", users(:one).salt
  end

  test "should require encrypted_password" do
    assert_equal "$2a$10$jt6gKPOaPLrn/uL8Zk3/ee9ntH0GQlIILDBzRs.emia2uzjU45eGy", users(:one).encrypted_password
  end


end


