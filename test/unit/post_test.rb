require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not be empty" do
    p=Post.new
    assert !p.valid?
  end

  test "should require title" do
    assert_equal "Android1", posts(:one).title
  end

  test "should require description" do
    assert_equal "test1!!", posts(:one).description
  end



end