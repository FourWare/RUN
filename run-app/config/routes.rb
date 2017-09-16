Rails.application.routes.draw do
  
  get 'home/registro'

  root to: 'home#index'
  get '/home/entrar'
  get 'home/registrarse'
  
  #get 'users/mainPage'
  #devise_for :users#, path: 'users', controllers: { sessions: 'users/sessions' }, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  devise_for :users, :path => 'home', :path_names => { :sign_in => 'entrar', :sign_up => 'registro', :sign_out => 'logout', :password => 'secret', :confirmation => 'verificación' }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :users
  #root to: 'users#mainPage'
end