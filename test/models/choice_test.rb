require 'test_helper'

class ChoiceTest < ActiveSupport::TestCase
  
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @choice=Choice.new(text: "x",correct: true,question_id: 1)
  end
  
  test "should be valid" do
    assert @choice.valid?
  end
  
  test "Question should be present" do
    @choice.text = ""
    assert_not @choice.valid?
  end

 test "should require a Question_id" do
    @choice.question_id = 1
    assert @choice.valid?
  end

  
end
