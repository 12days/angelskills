Angelskills::Application.routes.draw do

  root :to => 'skills#index'
  resources :skills

  get '/auth/:provider/callback', :to => "sessions#create", :as => :linkedin
  get '/auth/failure', :to => "sessions#failure"
  get '/login' => "sessions#new", :as => :login
  get "/logout" => "sessions#destroy", :as => :logout

end
