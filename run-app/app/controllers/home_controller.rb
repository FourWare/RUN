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
end
