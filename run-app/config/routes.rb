Rails.application.routes.draw do
  
  get 'users/eventCreate'
  get 'home/recuperacion_contrasena' => 'home#recuperacion_contrasena'
  get 'home/registro'
  get '/home/entrar'

  root to: 'home#index'
  
  devise_for :users, :path => 'home', :path_names => { :sign_in => 'entrar', :sign_up => 'registro', :sign_out => 'logout', :password => 'recuperacion_contrasena', :confirmation => 'verificación' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end