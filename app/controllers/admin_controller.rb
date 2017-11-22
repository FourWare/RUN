class AdminController < ApplicationController
  before_action :authenticate_user!
  
  def home
    #@users = User.paginate(page: params[:page], per_page: 10)
    #@users = User.where(:career => 'Medicina').paginate(:page => params[:page]).order('name ASC')
    @users = User.paginate(:page => params[:page], per_page: 10).order('name ASC')
    @countUser = User.countUsers()
    @countCarsUser = Car.carJoinUser()
    @app = 'RunApp'
    render :layout => 'admin_layout'
  end
  
  def statistics
    @countUser = User.countUsers()
    @countRoutes = Route.countRoutes(Route.all)
    @countCar = Car.totalCars()
    @routesLastWeek = Route.createdLastWeek
    @routesCreatedPerDay = Route.routesPerDay
    @usersCreatedPerDay = User.createdPerDay
    @carsPerModel = Car.carsPerYear
    @carsPerType = Car.perType
    @app = 'RunApp'
    respond_to do |format|
      format.html {render layout: 'admin_layout' }
      format.pdf { render template: 'admin/pdf_statistics',javascript_delay: 3000, pdf:'pdf', layout: 'pdf_statistics.html',header: { right: '[page] of [topage]'}}
    end
  end
end