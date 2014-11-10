Rails.application.routes.draw do
  devise_for :admins
  
  root "statics#index"

  resources :pages, :controller => :statics, only: [:index, :show] do 
    collection do
      get ':page', :action => :show, :as => :page
    end
  end

  resources :contacts, only: [:index, :create]

  namespace :admin do

    authenticated :admin do
      root "departures#index"#, :as => :authenticated_root
    end

    resources :admins 

    resources :contacts, only: [:index]

    resources :departures
    
  end

  get '(*url)'   => 'errors#index'
  
end
