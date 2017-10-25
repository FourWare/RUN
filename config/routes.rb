Rails.application.routes.draw do
  
  resources :routes, :path => "rutas"
  get '/usuario/updateSpacesAvailable' => 'routes#updateSpacesAvailable'
  get '/usuario/mis-rutas' => 'routes#show_my_routes'
  
  resources :cars, :path => "usuario/mis-vehiculos", :path_names => { :new => 'crear-vehiculo', :edit => 'editar' }
  
  get '/usuario/contactanos' => 'users#create_contactanos'
  get '/usuario/contactanos' => 'users#new_contactanos'
  get '/usuario/editar_perfil' => 'home#editar_perfil'
  get '/usuario/crear_evento' => 'users#eventCreate'
  get '/usuario/inicio' => 'users#show'
  
  get '/admin/home'
  get '/admin/statistics'

  get '/home/auth/google_oauth2/callback' => 'users#show'
  get '/home/recuperacion_contrasena' => 'home#recuperacion_contrasena'
  get '/home/registro'
  get '/home/entrar'

  root to: 'home#index'
  
  resources :contacts, only: [:new, :create]
  resources :users do
    member do
      get :confirm_email
    end
  end
  
  devise_for :users, :path => 'home', :path_names => { :sign_in => 'entrar', :sign_up => 'registro', :sign_out => 'logout', :edit => 'editar_perfil', :password => 'recuperacion_contrasena', :confirmation => 'verificación',  },
            :controllers => { omniauth_callbacks: "sessions" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

end