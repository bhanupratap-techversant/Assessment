Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'population_statistics#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :population_statistics, only: :index
  resources :health_services, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
