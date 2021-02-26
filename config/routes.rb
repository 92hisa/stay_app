Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
    # :controllers => { registrations: 'registrations'}
  root 'posts#index' 
  
  get '/users/:id', to: 'users#show', as: 'user'
  
  resources :users do
    get :list, on: :member
  end
  
  resources :posts do
    resources :reservations
  end
  
end
