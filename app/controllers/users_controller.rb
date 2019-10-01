class UsersController < ApplicationController
  def new
      @user = User.new      #need instance var
  end
  
  def index
      @users = User.all     #provide all users 
  end
  
  def create
      @user = User.new(user_params) #create user with form info 
      
      if (@user.save)
          redirect_to @user  #validation of created user goes back to home
      else
          render 'users/new'        #Send back to sign up page
      end
  end
  
  def show
      @user = User.find(params[:id])  #show specific post given id
  end  
  
  private def user_params
      params.require(:users).permit(:name, :email, :password) #ensures correct parameters
  end    
end