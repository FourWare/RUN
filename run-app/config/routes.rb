Rails.application.routes.draw do
  
  root to: 'home#index'

  #get 'users/mainPage'
  devise_for :users#, path: 'auth', controllers: { sessions: 'users/sessions' }, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :users
  #root to: 'users#mainPage'
end