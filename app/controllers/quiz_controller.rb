class QuizController < ApplicationController
  
   before_action :logged_in_user, only: [:index, :question, :end, :start]
  
 def index
  end
  
  def start
    #@begin_time = Time.now
   total = params[:number].to_i
   all = Question.all.map {|x| x.id}
   session[:questions] = all.sort_by{rand}[0..(total-1)]
   
   session[:total]   = total
   session[:current] = 0
   session[:correct] = 0
   session[:begin_time]=Time.now
   #puts {Time.now}
   redirect_to :action => "question"
  end

  def question
    @begin_time=session[:begin_time]
   @end_time= Time.now + 1.minutes
   @current = session[:current]
   @total   = session[:total]
   
   if @current >= @total || (@end_time.to_i - @begin_time.to_i) <= (1.minutes).to_i
    redirect_to :action => "end"
    return
   end
   
   @question = Question.find(session[:questions][@current])
   @choices = @question.choices.sort_by{rand}
   
   session[:question] = @question
   session[:choices] = @choices
     choiceid = params[:choice]
     @choice = choiceid ? Choice.find(choiceid) : nil
   if @choice and @choice.correct
    @correct = true
    session[:correct] += 1
   else
    @correct = false
   end
   
   session[:current] += 1
  end

  def answer
  end
  
 
  def end
   @correct = session[:correct]
   @total   = session[:total]
   
   @score = @correct * 100 / @total
  end
  
  def logged_in_user
      unless logged_in?
        #store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end
