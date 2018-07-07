Rails.application.routes.draw do
 
  namespace :backoffice do
    get 'admins/index'
  end
  get 'backoffice', to: 'backoffice/dashboard#index' 
  get 'admin', to: 'backoffice/dashboard#index'


  namespace :backoffice do
    resources :category
    get 'categories/index'
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
    get '/home', to: 'home#index'
  end

  devise_for :admins, :skip => [:registrations] 
  devise_for :members
  
  root 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
