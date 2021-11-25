Rails.application.routes.draw do
  root to: "pages#index", as: "pages"

  scope module: :api do
    scope module: :v1 do
      resources :movies, only: [:index] do
        collection { post :import }
      end
    end
  end
end
