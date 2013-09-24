Angelskills::Application.routes.draw do

  get '/auth/:provider/callback', :to => "sessions#create"
  get '/auth/failure', :to => "sessions#failure"
  get '/login' => "sessions#new", :as => :login
  get "/logout" => "sessions#destroy", :as => :logout

  root :to => 'skills#index'
  resources :skills

end
