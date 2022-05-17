# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :books do
  #   member do
  #     get 'delete_multiple'
  #   end
  # end
  resources :tasks, only: :index, param: :slug

  root "home#index"
  get '*path', to: 'home#index', via: :all
end
