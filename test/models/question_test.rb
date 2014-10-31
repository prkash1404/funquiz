require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  
  def setup
    @question=questions(:one)
  end
  
  test "should be valid" do
    assert @question.valid?
  end

  test "Question should be present" do
    @question.text = ""
    assert_not @question.valid?
  end


   
  
end
