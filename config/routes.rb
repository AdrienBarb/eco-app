Rails.application.routes.draw do

  namespace :admin do
    root 'application#index'

    resources :users, only: :index
  end

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update]

  resources :projects, only: [:show, :index, :new, :create, :edit, :update, :destroy]

  root to: "pages#home"
end
