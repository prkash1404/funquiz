class Choice < ActiveRecord::Base
  belongs_to :question
  
  validates :text, presence: true, length: { maximum: 145 }
  
  #before_save :valid_answer
  
  
  
  
  
  
 
  
end
