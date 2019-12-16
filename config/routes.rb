Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :cabs
      resources :customers
      resources :rides do
        member do
          post :ride_complete
        end
      end
    end
  end
end
