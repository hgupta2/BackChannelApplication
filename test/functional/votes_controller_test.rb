require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  setup do
    @vote = votes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote" do
    assert_difference('Vote.count') do
      post :create, vote: {  }
    end

    assert_redirected_to posts_path
  end


  test "should destroy vote" do
    assert_difference('Vote.count', -1) do
      delete :destroy, id: @vote
    end

    assert_redirected_to posts_path
  end
end
