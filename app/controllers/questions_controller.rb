class QuestionsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token 
  before_action :admin_user, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  caches_action :new , :index
  cache_sweeper :question_sweeper
  def index
    @questions = Question.all
    @questions.sort {|a,b| a <=> b}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.xml
  def show
   #expire_action :action => :index
    @question = Question.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
     # format.xml  { render :xml => @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.xml
  def new
    #expire_action :action => :index
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  # GET /questions/1/edit
  def edit
    #expire_action :action => :index
  # expire_fragment :action => :index
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.xml
  def create
    #expire_action :action => :index
   #expire_fragment :action => :index
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to(@question  , :alert => 'Question was successfully created.') }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.xml
  def update
   #expire_action :action => :index
  # expire_fragment :action => :index
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(question_params)
        format.html { redirect_to(@question , :alert => 'Question was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.xml
  def destroy
    #expire_fragment :action => :index
    #expire_action :action => :index
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(questions_url) }
      format.xml  { head :ok }
    end
  end
  
   def logged_in_user
      unless logged_in?
        #store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
     def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
    
  
  private
  
   def question_params
      params.require(:question).permit(:text)
    end
  
  
end
