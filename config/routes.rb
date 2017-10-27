Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'files#index'

  resources :company do
    resources :shop do
      resources :file
    end
  end
end
