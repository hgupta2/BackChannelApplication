require 'test_helper'

class CommentTest < ActiveSupport::TestCase


  test "should not be empty" do
    co=Comment.new
    assert !co.valid?
  end

  test "should require description" do
    assert_equal "its awesome!!", comments(:one).description
  end




end