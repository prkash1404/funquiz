require 'test_helper'

class ChoiceTest < ActiveSupport::TestCase
  
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @choice=choices(:one)
    @answer=choices
  end
  
  test "should be valid" do
    assert @choice.valid?
  end
  
  test "Question should be present" do
    @choice.text = ""
    assert_not @choice.valid?
  end

  test "should require a Question_id" do
    @choice.question_id = nil
    assert_not !@choice.valid?
  end
  
  test "should not too long" do
    @choice.text = "a" * 51
    assert_not @choice.valid?
  end
  
  test "Answers should have correct option" do
    
    
  end
  
end
