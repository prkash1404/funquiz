require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    
    @user       = users(:prakash)
    @other_user = users(:surender)
    @question = questions(:one)
  end

  test "should get index" do
    log_in_as(@user)
    get :index
    assert_response :success
    
  end

  test "should get new" do
    log_in_as(@user)
    get :new
    assert_response :success
  end

  test "should create question" do
    log_in_as(@user)
    assert_difference('Question.count') do
      post :create, :question => @question.attributes
    end
    assert_redirected_to question_path(assigns(:question))
  end
  
  test "should redirect create when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Question.count' do
      delete :destroy, id: @question
    end
    assert_redirected_to root_url
  end

  test "should show question" do
    log_in_as(@user)
    get :show, :id => @question.to_param
    assert_response :success
  end
  
  test "should redirect show when logged in as a non-admin" do
    log_in_as(@other_user)
    get :show, :id => @question.to_param
    assert_redirected_to root_url
  end

  test "should get edit" do
    log_in_as(@user)
    get :edit, :id => @question.to_param
    assert_response :success
  end
  
  test "should redirect edit when logged in as a non-admin" do
    log_in_as(@other_user)
    get :edit, :id => @question.to_param
    assert_redirected_to root_url
  end

  test "should update question" do
    log_in_as(@user)
    put :update, :id => @question.to_param, :question => @question.attributes
    assert_redirected_to question_path(assigns(:question))
  end
  
  
  test "should redirect update when logged in as a non-admin" do
    log_in_as(@other_user)
    put :update, :id => @question.to_param, :question => @question.attributes
    assert_redirected_to root_url
  end



  test "should destroy question" do
    log_in_as(@user)
    assert_difference('Question.count', -1) do
      delete :destroy, :id => @question.to_param
    end

    assert_redirected_to questions_path
  end
  
  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference('Question.count', -1) do
      delete :destroy, :id => @question.to_param
    end

    assert_redirected_to root_url
  end


  
end
