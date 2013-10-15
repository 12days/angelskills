Angelskills::Application.routes.draw do

  root :to => 'skills#index'
  resources :skills

  devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks' }
                        # , path_names: { sign_in: 'login', sign_out: 'logout' }
  devise_scope :user do
    get 'login', :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
  end

  get '/auth/:provider/callback', :to => "sessions#create"
  # get '/auth/failure', :to => "sessions#failure"

end
