Rails.application.routes.draw do
  
  resources :statistics
  resources :routes, :path => "rutas"
  resources :cars, :path => "usuario/mis-vehiculos", :path_names => { :new => 'crear-vehiculo', :edit => 'editar' }
  resources :contacts, only: [:new, :create]
  
  resources :usuario, except: [:index, :create, :new, :edit, :show, :update, :destroy] do
    collection do
      get 'contactanos' => 'users#create_contactanos' 
      get 'contactanos' => 'users#new_contactanos'
      get 'inicio' => 'users#show'
      get 'crear_evento' => 'users#eventCreate'
      get 'editar_perfil' => 'home#editar_perfil'
      get 'mis-rutas' => 'routes#show_my_routes'
      get 'updateSpacesAvailable' => 'routes#updateSpacesAvailable'
      get 'actualización-de-calificaciones' => 'routes#updateRatings'
      get 'actualización-de-comentarios' => 'routes#updateComments'
    end
  end
  
  resources :admin, except: [:index, :create, :new, :edit, :show, :update, :destroy] do
    collection do
      get 'home', 'statistics'
    end
  end
  
  resources :home, except: [:index, :create, :new, :edit, :show, :update, :destroy] do
    collection do
      get 'auth/google_oauth2/callback' => 'users#show'
      get 'recuperacion_contrasena', 'registro', 'entrar'
    end
  end
  
  resources :users do
    member do
      get :confirm_email
    end
  end
  
  devise_for :users, :path => 'home', :path_names => { :sign_in => 'entrar', :sign_up => 'registro', :sign_out => 'logout', :edit => 'editar_perfil', :password => 'recuperacion_contrasena', :confirmation => 'verificación',  },
            :controllers => { omniauth_callbacks: "sessions" }

  root to: 'home#index'

end





#get '/admin/home'
#get '/admin/statistics'

#get '/home/auth/google_oauth2/callback' => 'users#show'
#get '/home/recuperacion_contrasena' => 'home#recuperacion_contrasena'
#get '/home/registro'
#get '/home/entrar'

#get '/usuario/updateSpacesAvailable' => 'routes#updateSpacesAvailable'
#get '/usuario/mis-rutas' => 'routes#show_my_routes'
#get '/usuario/contactanos' => 'users#create_contactanos'
#get '/usuario/contactanos' => 'users#new_contactanos'
#get '/usuario/editar_perfil' => 'home#editar_perfil'
#get '/usuario/crear_evento' => 'users#eventCreate'
#get '/usuario/inicio' => 'users#show'