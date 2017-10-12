class AdminController < ApplicationController
  before_action :authenticate_user!
  
  def home
    #@users = User.paginate(page: params[:page], per_page: 10)
    #@users = User.where(:career => 'Medicina').paginate(:page => params[:page]).order('name ASC')
    @users = User.paginate(:page => params[:page], per_page: 10).order('name ASC')
    @countUser = User.count
    @countCarsUser = Car.joins(:user).uniq
    @app = 'RunApp'
    render :layout => 'admin_layout'
  end
end