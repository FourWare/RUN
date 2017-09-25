class AdminController < ApplicationController
  before_action :authenticate_user!
  
  def home
    @users = User.paginate(page: params[:page], per_page: 1)
    @app = 'RunApp'
    render :layout => 'admin_layout'
  end
end
