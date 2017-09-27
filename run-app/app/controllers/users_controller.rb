class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:new_contactanos, :create_contactanos]
  
  def show
    render :layout => 'mailer'
  end
  
  def mainPage
  end
  
  def eventCreate
    render :layout => 'eventCreate'
  end
  
  def new_contactanos
    @app = "RunApp"
    @contact = Contact.new
  end
  
  def create_contactanos
    @app = "RunApp"
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Gracias por tu mensaje!'
    else
      flash.now[:alert] = 'No se pudo enviar el mensaje. Asegúrate de tener los campos correctamente.'
      render :new_contactanos
    end
  end
end
