CodeAwards::Application.routes.draw do

 
  resources :projects do
    member do
     get :vote_up
   end
  end   
                                                   
  match 'users/auth/twitter/callback'  => 'sessions#create'
  match 'users/auth/github/callback'  => 'sessions#create'
  match 'users/auth/liveid/callback'  => 'sessions#create'
  match '/registrations' => 'registrations#email'

  devise_for :users, :controllers => { :omniauth_callbacks => "sessions"} 
  
  match "libraries" =>"libraries#index"
  
  root :to => "home#index"
  
  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end

  resources :users                                                     
  devise_for :users, :controllers => {:registrations => "registrations"} 
  resources :authentications
end
