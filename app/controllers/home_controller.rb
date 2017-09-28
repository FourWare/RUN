class HomeController < ApplicationController
  def index
    @app = "RunApp"
    render :layout => 'home-layout'
  end
  
  def entrar
    @app = "RunApp"
    render :layout => 'entrar'
  end
  
  def registro
    @app = "RunApp"
    render :layout => 'registro'
  end
  
  def recuperacion_contrasena
    @app = "RunApp"
    render :layout => 'recuperacion_contrasena'
  end
  
  def editar_perfil
    @app = "RunApp"
    render :layout => 'editar_perfil'
  end
end
