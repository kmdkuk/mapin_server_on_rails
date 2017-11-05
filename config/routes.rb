Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'data_formats#index'

  resources :companies do
    resources :shops do
      resources :uploaded_files
    end
  end

  namespace :api do
    resources :shops do
      resources :files
    end
    resources :files
  end
end
