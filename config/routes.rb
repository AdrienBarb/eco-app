Rails.application.routes.draw do

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

  resources :skills, only: [:index, :new, :create, :edit, :update, :destroy]

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

  root to: "projects#index" do
  end
end
