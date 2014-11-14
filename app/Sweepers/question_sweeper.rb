class QuestionSweeper < ActionController::Caching::Sweeper
  observe Question
  
  # If our sweeper detects that a Question was created call this
  def after_create(question)
    expire_cache_for(question)
  end
 
  def after_show
    expire_cache_for(question)
  end
  
  def after_edit(question)
    expire_cache_for(question)
    
  end
   
  
  
  def after_new(question)
    expire_cache_for(question)
  end
  # If our sweeper detects that a Question was updated call this
  def after_update(question)
    expire_cache_for(question)
  end
 
  # If our sweeper detects that a Question was deleted call this
  def after_destroy(question)
    expire_cache_for(question)
  end
 
  private
  
  def expire_cache_for(question)
    # Expire the index page now that we added a new Question
   expire_action(:controller => 'questions', :action => 'index')
 
    # Expire a fragment
   
  end
  
end