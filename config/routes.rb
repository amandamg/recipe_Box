Rails.application.routes.draw do
  get 'home/index'

  resources :users, shallow: true do
    resources :recipes do
      resources :comments
    end
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
