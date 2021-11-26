Rails.application.routes.draw do
  root to: "pages#index"

  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index] do
        collection { post :import }
      end
    end
  end
end
