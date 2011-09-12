class AuthenticationsController < SessionsController
  # Load user's authentications (Twitter, Facebook, ....)
   def index
     @authentications = current_user.authentications if current_user
   end                       
   # Load user's authentications (Twitter, Facebook, ....)
    def show
      @authentications = Authentication.find(params[:id]) 
    end
end
