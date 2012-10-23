require 'test_helper'

class VotecommentsControllerTest < ActionController::TestCase
  setup do
    @votecomment = votecomments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:votecomments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create votecomment" do

    assert_difference('Votecomment.count') do
      @comment = comments(:one)
      commentid = @comment.id

      post :create, votecomment: {  }
    end

    assert_redirected_to votecomment_path(assigns(:votecomment))
  end

  test "should show votecomment" do
    get :show, id: @votecomment
    assert_response :success
  end

  test "should destroy votecomment" do
    assert_difference('Votecomment.count', -1) do
      delete :destroy, id: @votecomment
    end

    assert_redirected_to posts_path
  end
end
