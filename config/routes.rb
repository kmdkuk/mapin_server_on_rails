Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'companies#index'
  get '/sample', to: 'data_formats#index'
  resources :companies, shallow: true do
    resources :shops do
      resources :files, controller: :uploaded_files do
        get 'download', to: 'uploaded_files#download'
      end
    end
  end

  resources :categories

  namespace :api do
    resources :shops do
      resources :files
    end
    resources :files
  end
end
