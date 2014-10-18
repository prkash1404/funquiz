require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user       = users(:prakash)
    @other_user = users(:surender)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end

test "should redirect login when not logged in" do
    get :show, id: @user
    assert_redirected_to login_url
  end
  
end
