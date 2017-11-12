class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:new_contactanos, :create_contactanos, :show, :eventCreate]
  
  def show
    @app = "RunApp"
    render :layout => 'user-layout'
  end
  
  def mainPage
  end
  
  def eventCreate
    @app = "RunApp"
    render :layout => 'user-layout'
  end
  
  def new_contactanos
    @app = "RunApp"
    @contact = Contact.new
    render :layout => 'user-layout'
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
  
  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user_params
      user.email_activate
      flash[:notice] = "Tu cuenta ha sido confirmada con éxito."
      redirect_to root_url
    else
      flash[:alert] = "Error: El usuario no existe."
      redirect_to root_url
    end
  end
  
  def public_profile
    @a = params[:username]
    @user = User.find_by_nick(params[:username])
  end
end
