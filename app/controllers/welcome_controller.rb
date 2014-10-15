class WelcomeController < ApplicationController
  def home  
    if logged_in?
      render "users/show"
    end
  end
  
  def help 
  end
  
end
