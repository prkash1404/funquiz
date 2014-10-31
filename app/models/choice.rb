class Choice < ActiveRecord::Base
  belongs_to :question
  
  validates :text, presence: true, length: { maximum: 25 }
  
  #before_save :valid_answer
  
  
  
  
  
  
 
  
end
