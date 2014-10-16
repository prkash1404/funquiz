class Question < ActiveRecord::Base
   has_many :choices
  
  def answer
   uncorrect
   choices.select {|c| c.correct}[0]
  end 
  
  def uncorrect
   choices.each {|c| c.correct = false}
  end
  
  def answer= choice
   if !answer.nil?
    answer.correct = false
   end
   
   if choices.include? choice
    choice.correct = true
   else
    choices << choice
    choice.correct = true
   end
  end
end
