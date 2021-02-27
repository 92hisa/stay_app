Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
    # :controllers => { registrations: 'registrations'}
  root 'posts#index' 
  
  get '/users/:id', to: 'users#show', as: 'user'
  
  get '/reservations', to: 'reservations#index', as: :reservation_history
  get '/lending', to: 'reservations#lending', as: :lending_history
  
  resources :users do
    get :list, on: :member
  end
  
  resources :posts do
    resources :reservations
  end
  
end
