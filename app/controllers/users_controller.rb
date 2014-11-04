class UsersController < ApplicationController
 
  before_action :logged_in_user, only: [:show]
  caches_page :new
  
  def new
    @user=User.new
  end
  
  def show   
    render 'quiz/index'
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to FunQuiz!"
      redirect_to @user
    else
      render 'new'
    end
  end
   
   
   def logged_in_user
      unless logged_in?
        #store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  
   private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
  
end
