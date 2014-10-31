class WelcomeController < ApplicationController
  
  
  
  def home  
    if logged_in?
      render "quiz/index"
    end
  end
  
  def help 
  end
  
end
