Angelskills::Application.routes.draw do

  root :to => 'skills#index'
  resources :skills

  devise_scope :users do
    get 'login', :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
  end

  # get '/auth/:provider/callback', :to => "sessions#create"
  # get '/auth/failure', :to => "sessions#failure"

end
