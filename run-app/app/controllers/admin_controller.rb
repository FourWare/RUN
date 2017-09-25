class AdminController < ApplicationController
  before_action :authenticate_user!
  
  def home
    @users = User.paginate(page: params[:page], per_page: 1)
    render :layout => 'admin_layout'
    @app = 'RunApp'
  end
end
