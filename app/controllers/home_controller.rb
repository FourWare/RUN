class HomeController < ApplicationController
  before_action :authenticate_user!, :only => [:editar_perfil]
  def index
    @app = "RunApp"
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    end
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
    @image = User.profileImage(current_user.id)
    render :layout => 'user-layout'
  end
end
