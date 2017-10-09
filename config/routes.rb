Rails.application.routes.draw do
  
  resources :routes
  get 'usuario/contactanos' => 'users#create_contactanos'
  get 'usuario/contactanos' => 'users#new_contactanos'
  get '/contactanos' => 'users#create_contactanos'
  get '/contactanos' => 'users#new_contactanos'
  get 'admin/home'
  get 'usuario/editar_perfil' => 'home#editar_perfil'
  get 'usuario/crear_evento' => 'users#eventCreate'
  get 'usuario/inicio' => 'users#show'
  get 'home/recuperacion_contrasena' => 'home#recuperacion_contrasena'
  get 'home/registro'
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