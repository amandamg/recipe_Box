Rails.application.routes.draw do
  get 'search/index'
  devise_for :users
  

  resources :users, shallow: true do
    resources :recipes do
      resources :comments
    end
  end


  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
