class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
 #helper_method :current_user
 #helper_method :user_signed_in?
 #helper_method :correct_user?
 #
 #private
 #  def current_user
 #    begin
 #
 #      @current_user ||= User.find(session[:user_id]) if session[:user_id]
 #      Rails.logger.info @current_user.inspect + "%%%%%%%current_user%%%%%%%%"
 #      
 #    rescue Mongoid::Errors::DocumentNotFound
 #      nil
 #    end
 #  end
 #
 #  def user_signed_in?
 #    Rails.logger.info @current_user.inspect + "%%%%%%%user_signed_in%%%%%%%%"
 #    return true if current_user
 #  end
 #  
 #  def correct_user?
 #    @user = User.find(params[:id])
 #    unless current_user == @user
 #      redirect_to root_url, :alert => "Access denied."
 #    end
 #  end
 #
 #  def authenticate_user!
 #    if !current_user
 #      redirect_to root_url, :alert => 'You need to sign in for access to this page.'
 #    end
 #  end
 #
end
