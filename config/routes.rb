Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home" 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'past', to: 'pages#past', as: 'past' 
  get 'present', to: 'pages#present', as: 'present' 
  get 'future', to: 'pages#future', as: 'future' 

  #refactor for shallow nesting in each one!  , shallow: true

  namespace :past do
      resources :regretlist, except: [:index, :edit, :update, :destroy] do 
        resources :regret#, except: [:index]
      end
      #Let's see how this goes...
      resources :experiment
  end

  namespace :present do
    resources :badhabitlist, except: [:index, :edit, :update, :destroy] do 
      resources :badhabit
    end
    resources :currentlegacy, except: [:index] do 
      resources :currentlegacydisconnect, except: [:index]
    end
  end

  namespace :future do
    resources :futureregretlist, except: [:index, :edit, :update, :destroy] do 
      resources :futureregret, except: [:index]
    end
    resources :dreamlegacy, except: [:index] do 
      resources :dreamlegacystep, except: [:index]
    end
  end


end
