class RegistrationsController < ApplicationController
  def email
    if session[:omniauth]
      if params[:email]
        user = User.new
        user.email = params[:email]
        user.apply_omniauth(session[:omniauth], false)
        if user.save
          user.authentications.create!(:provider => session[:omniauth]['provider'], :uid => session[:omniauth]['uid'])
          session[:omniauth] = nil
          # Create a new User through omniauth
          # Register the new user + create new authentication
          flash[:notice] = t(:welcome)
          sign_in_and_redirect(:user, user)
        else
          flash[:alert] = user.errors.to_a[0]
          redirect_to new_user_registration_url
        end
      end
    else
      flash[:alert] = t(:fail)
      redirect_to new_user_registration_url
    end
  end
  
  def edit    
    @user = params[:id].present?  && (can? :manage, @users) ? User.find(params[:id]) : current_user
    render  'devise/registrations/edit'
  end
end
