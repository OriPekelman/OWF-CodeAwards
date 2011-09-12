class SessionsController < ApplicationController

   # Create an authentication when this is called from
   # the authentication provider callback
   def create
     omniauth = request.env["omniauth.auth"]  
     authentication = Authentication.where(:provider => omniauth['provider'], :uid => omniauth['uid']).first
     if authentication  
       # Just sign in an existing user with omniauth
       # The user have already used this external account
       flash[:notice] = t(:signed_in)
       sign_in_and_redirect(:user, authentication.user)
     elsif current_user
       # Add authentication to signed in user
       # User is logged in
       current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
       flash[:notice] = t(:success)
       redirect_to authentications_url
     elsif omniauth['provider'] != 'twitter' && omniauth['provider'] != 'liveid' && omniauth['provider'] != 'github' && user = create_new_omniauth_user(omniauth)
       user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
       # Create a new User through omniauth
       # Register the new user + create new authentication
       flash[:notice] = t(:welcome)
       sign_in_and_redirect(:user, user)
     elsif (omniauth['provider'] == 'twitter' || omniauth['provider'] == 'liveid'  || omniauth['provider'] == 'github') && 
       omniauth['uid'] && (omniauth['user_info']['name'] || omniauth['user_info']['nickname'] || 
       (omniauth['user_info']['first_name'] && omniauth['user_info']['last_name']))
       session[:omniauth] = omniauth.except('extra');
       redirect_to(:controller => 'registrations', :action => 'email')
     else
       # New user data not valid, try again
       flash[:alert] = t(:fail)
       redirect_to new_user_registration_url
     end
   end

   # Destroy an authentication
   def destroy
     @authentication = current_user.authentications.find(params[:id])
     @authentication.destroy
     flash[:notice] = t(:successfully_destroyed_authentication)
     redirect_to authentications_url
   end

   def create_new_omniauth_user(omniauth)
     user = User.new
     user.apply_omniauth(omniauth, true)
     if user.save
       user
     else
       nil
     end
   end      
   
  def failure   
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
