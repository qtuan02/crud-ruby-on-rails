Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tests, only: [:index,:show, :create, :update, :destroy], controller: 'test'
    end
  end
end
