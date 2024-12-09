Rails.application.routes.draw do
  root 'static_pages#home'  # Assure-toi que la route de la page d'accueil est bien définie ici
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/welcome/:first_name', to: 'static_pages#welcome'
  resources :gossips, only: [:index, :show]
  resources :users, only: [:show]
end
