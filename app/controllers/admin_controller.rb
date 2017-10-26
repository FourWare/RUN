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
  
  def statistics
    @countUser = User.count
    @countRoutes = Route.count
    @countCar = Car.count
    @routesLastWeek = Route.createdLastWeek
    @routesCreatedPerDay = Route.createdPerDay
    @usersCreatedPerDay = User.createdPerDay
    @carsPerModel = Car.carsPerYear
    @carsPerType = Car.perType
    @app = 'RunApp'
    respond_to do |format|
    format.html {render layout: 'admin_layout' }
    format.pdf { render template: 'admin/pdf_statistics',javascript_delay: 3000, pdf:'pdf', layout: 'pdf_statistics.html'}
  end
  end
end