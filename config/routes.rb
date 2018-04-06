Rails.application.routes.draw do
  
  devise_for :admins, :skip => [:registrations]
  devise_for :members
  root 'site/home#index'

  namespace :backoffice do
    resources :categories, except: [:show, :destroy]
    resources 'admins', except: [:show]
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
    get 'home', to: 'home#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
