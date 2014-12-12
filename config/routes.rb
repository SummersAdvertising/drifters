Rails.application.routes.draw do
  devise_for :admins
  
  root "statics#index"

  resources :pages, :controller => :statics, only: [:index, :show] do 
    collection do
      get ':page', :action => :show, :as => :page
    end
  end

  resources :contacts, only: [:index, :create] do
    collection do
      get :fetch_tours_detail
    end
  end
  
  resources :departures do
    collection do
      get :fetch_departures_detail
    end
  end

  namespace :admin do

    authenticated :admin do
      root "tours#index"#, :as => :authenticated_root
    end

    resources :admins 

    resources :contacts, :only => [:index, :update] do
      collection do 
        get 'history', action: 'history'
      end
    end

    resources :tours do 
      resources :departures
    end

    resources :departures do 
      member do
        patch 'reorder' , :action => 'reorder'
      end 
    end

  end

  get '(*url)'   => 'errors#index'
  
end
