TaxCompactorApi::Application.routes.draw do
  resources :preparations, except: [:new, :edit]
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1 do
      resources :preparations, only: [:index, :create, :show, :update] do
        resources :forms, only: [:index]
      end
    end
  end
end
