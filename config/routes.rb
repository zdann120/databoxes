Rails.application.routes.draw do
  resources :boxes do
    resources :data, only: [] do
      get 'payload', on: :member, to: 'boxes#payload'
    end
  end
  root to: 'visitors#index'
  get 'visitors/index'

  devise_for :users
  namespace :api do
    namespace :v1 do
      scope :decode do
        get 'datum/:box_id', to: 'data#decode'
      end
      resources :boxes, only: [:show] do
        resources :data, on: :member, only: [:create, :show, :update, :destroy]
        get 'keys', on: :member, to: 'boxes#keys'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
