Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books do
    member do
      get 'delete_multiple'
    end
  end
end
