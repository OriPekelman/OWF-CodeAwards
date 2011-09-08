class SessionsController < ApplicationController

  def new  
    raise request.env["omniauth.auth"].to_yaml  
  end

    def github               
      Rails.logger.info "XXXXXXXX sessions_controller#new\n"  + session.inspect
      Rails.logger.info request.env["omniauth.auth"].inspect           
        
      auth = request.env["omniauth.auth"]
      user = User.where(:provider => auth['provider'], 
                        :uid => auth['uid']).first || User.create_with_omniauth(auth)
      session[:user_id] = user.id   
      redirect_to root_url, :notice => 'Signed in!'
    end

      def twitter               
        Rails.logger.info "XXXXXXXX sessions_controller#new\n"  + session.inspect
        Rails.logger.info request.env["omniauth.auth"].inspect           

        auth = request.env["omniauth.auth"]
        user = User.where(:provider => auth['provider'], 
                          :uid => auth['uid']).first || User.create_with_omniauth(auth)
        session[:user_id] = user.id   
        redirect_to root_url, :notice => 'Signed in!'
      end


  def create               
    Rails.logger.info "XXXXXXXX sessions_controller#new\n"  + session.inspect
    Rails.logger.info request.env.inspect           

    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'], 
                      :uid => auth['uid']).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id   
#    redirect_to root_url, :notice => 'Signed in!'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure   
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
