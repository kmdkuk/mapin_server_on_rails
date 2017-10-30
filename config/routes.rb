Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'files#index'

  resources :companies do
    resources :shops do
      resources :files
    end
  end
end
