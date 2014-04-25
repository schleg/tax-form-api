TaxCompactorApi::Application.routes.draw do
  resources :preparations, except: [:new, :edit]
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1 do
      resources :test, only: :index
      resources :preparations
    end
  end
end
