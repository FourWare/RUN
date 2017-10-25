class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /routes
  # GET /routes.json
  def index
    @routes = Route.filterSearchOtherRoutes(params[:filterSelect], params[:search], current_user.id).paginate(:page => params[:page], per_page: 10).order('created_at DESC')
    @countOtherRoutes = Route.countOtherRoutes(current_user.id)
    @countRoutesFilter = @routes.count
    render :layout => 'user-layout'
  end
  
  def show_my_routes
    @routes = Route.filterSearchMyRoutes(params[:filterSelect], params[:search], current_user.id).paginate(:page => params[:page], per_page: 10).order('created_at DESC')
    @countMyRoutes = Route.countMyRoutes(current_user.id)
    @countRoutesFilter = @routes.count
    render :layout => 'user-layout'
  end

  # GET /routes/1
  # GET /routes/1.json
  def show
    @extraInfoRouteConductor =  Route.extraInfoRouteConductor(@route.id_user)
    @extraInfoRoute = Route.extraInfoRoute(@route.car_placa)
    @usersInRoute = Route.usersInRoute(@route.id)
    render :layout => 'user-layout'
  end

  def updateSpacesAvailable
    if(params[:act] == 'add')
      if( Route.checkUserInRoute(params[:id_route], params[:id_user]) == false )  
        Route.addUserToRoute(params[:id_route], params[:id_user])
      end
    elsif(params[:act] == 'remove')
      if( Route.checkUserInRoute(params[:id_route], params[:id_user]))
        Route.removeUserToRoute(params[:id_route], params[:id_user])
      end
    end
  end

  # GET /routes/new
  def new
    @myCars = Car.where(:user_id => current_user.id)
    @route = Route.new
    #@myCars = Route.myCars(current_user.id)
    render :layout => 'user-layout'
  end

  # GET /routes/1/edit
  def edit
    @myCars = Route.myCars(current_user.id)
    render :layout => 'user-layout'
  end

  # POST /routes
  # POST /routes.json
  def create
    @route = Route.new(route_params)

    respond_to do |format|
      if @route.save
        format.html { redirect_to @route, notice: 'Route was successfully created.' }
        format.json { render :show, status: :created, location: @route }
      else
        format.html { render :new }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routes/1
  # PATCH/PUT /routes/1.json
  def update
    respond_to do |format|
      if @route.update(route_params)
        format.html { redirect_to @route, notice: 'Route was successfully updated.' }
        format.json { render :show, status: :ok, location: @route }
      else
        format.html { render :edit }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1
  # DELETE /routes/1.json
  def destroy
    @route.destroy
    respond_to do |format|
      format.html { redirect_to routes_url, notice: 'Route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @route = Route.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_params
      params.require(:route).permit(:title, :description, :from_lat, :from_lng, :to_lat, :to_lng, :waypoints, :departure, :cost, :id_user, :car_placa, :spaces_available, :users_in_route)
    end
end
