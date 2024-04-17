Rails.application.routes.draw do
  mount RailsAdmin::Engine => 'fuckyouhackers', as: 'rails_admin'
  devise_for :users
  root to: "pages#home"# unless current_user.signed_in?
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount PgHero::Engine, at: "pghero"

  
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard' 
  get 'past', to: 'pages#past', as: 'past' 
  get 'present', to: 'pages#present', as: 'present' 
  get 'future', to: 'pages#future', as: 'future' 

  #refactor for shallow nesting in each one!  , shallow: true

  scope :past do #namespace
      resources :regretlist, except: [:index, :edit, :update, :destroy] do 
        resources :regret#, except: [:index] not sure though, try it out!
      end
      #Let's see how this goes...
      resources :experiment, :path => 'experiments'  #Make only the index say experiments
  end

  scope :present do #namespace
    resources :badhabitlist, except: [:index, :edit, :update, :destroy] do 
      resources :badhabit
    end
    resources :currentlegacy, except: [:index] do 
      resources :currentlegacydisconnect, except: [:index]
    end
  end

  scope :future do #namespace
    resources :futureregretlist, except: [:index, :edit, :update, :destroy] do 
      resources :futureregret, except: [:index]
    end
    resources :dreamlegacy, except: [:index] do 
      resources :dreamlegacystep, except: [:index]
    end
  end

  # Do later for admin and production
  # authenticate :user, ->(user) { user.admin? } do
  #   mount PgHero::Engine, at: "pghero"
  # end


end
