class UsersController < ApplicationController
before_filter :authenticate_user!, :except => [:index, :show]

  def show
    @user = User.find(params[:id])     
    @projects = Project.where(:user_id => params[:id]).
                                        order_by(:up_count.desc)
  end
         
  def create
    raise "hell"
  end
               
     def new
       raise "hell"
     end
     
   def index
     @users = User.all
   end

   def edit         
     if ( params[:id].present?  && (can? :manage, User) )  
       @user = User.find(params[:id])  
     else              
       @user = User.find(params[:id])  
       flash[:alert] = t(:fail)
       redirect_to @user
     end
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
