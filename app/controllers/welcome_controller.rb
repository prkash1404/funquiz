class WelcomeController < ApplicationController
 #skip_before_action :verify_authenticity_token
  caches_action :home
  #caches_page :home
  def home  
    if logged_in?
      #expire_page :action => :home
      expire_action :action => :home
      render "quiz/index"
    end
  end
  
  def help 
  end
  
end
