TaxCompactorApi::Application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1 do
      resources :test, only: :index
    end
  end
end
