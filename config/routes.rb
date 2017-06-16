Rails.application.routes.draw do
  namespace :api do
    resources :agencies, only: [:index, :create]
  end
end
