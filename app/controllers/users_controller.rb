class UsersController < ApplicationController
before_filter :authenticate_user!, :except => [:index, :show]

  def show
    @user = User.find(params[:id])
  end
     
   def index
     @users = User.all
   end

  def edit
    @user = current_user
    #User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end
  
end
