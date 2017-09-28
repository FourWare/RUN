class AdminController < ApplicationController
  before_action :authenticate_user!
  
  def home
    @app = 'RunApp'
    render :layout => 'admin_layout'
  end
  
  def usuarios
    @users = User.paginate(page: params[:page], per_page: 20)
    @app = 'RunApp'
    render :layout => 'admin_layout'
  end
end
