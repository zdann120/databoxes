Rails.application.routes.draw do
  resources :boxes
  root to: 'visitors#index'
  get 'visitors/index'

  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :boxes, only: [:show] do
        resources :data, on: :member, only: [:create, :show, :update, :destroy]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
