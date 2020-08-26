Rails.application.routes.draw do

  root to: "pages#home"

  namespace :admin do
    root 'application#index'

    resources :users, only: [:index, :show] do
      member do
        patch :archive
      end
    end
  end

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :edit, :update]

  resources :skills, only: [:index, :new, :create, :edit, :update, :destroy] do
    member do
      patch :recommend
    end
  end

  resources :projects, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    member do
      get :edit_roles
      patch :update_roles
    end

    member do
      patch :upvote
    end

    resources :tags, only: [] do
      member do
        delete :remove
      end
    end

    resources :comments, only: [:new, :create]
  end

  resources :comments, only: [] do
    resources :answers, only: [:new, :create]
  end



  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: { registrations: 'api/v1/registrations' }

      resources :users, only: [:index, :show, :update]

      resources :users, only: [:create]

      resources :projects do
        member do
          get :edit_roles
          patch :update_roles
        end

        member do
          patch :upvote
        end

        resources :comments, only: [:create]
      end

      resources :skills, only: [:index, :create, :update, :destroy] do
        member do
          patch :recommend
        end
      end

      resources :comments, only: [] do
        resources :answers, only: [:new, :create]
      end


    end
  end

end
