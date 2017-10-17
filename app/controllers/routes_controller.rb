class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /routes
  # GET /routes.json
  def index
    @routes = Route.otherRoutes(current_user.id).paginate(:page => params[:page], per_page: 10).order('created_at DESC')
    @countRoutes = Route.countRoutes(current_user.id)
    render :layout => 'user-layout'
  end

  # GET /routes/1
  # GET /routes/1.json
  def show
    @extraInfoRoute = Route.extraInfoRoute(@route.car)
    @findByBrand = Route.findByBrand("Renault")
    @findByColor = Route.findByColor("Gris")
    @findByCapacity = Route.findByCapacity(4)
    @findByType = Route.findByType("carro")
    
    render :layout => 'user-layout'
  end

  # GET /routes/new
  def new
    @myCars = Route.myCars(current_user.id)
    @route = Route.new
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
  
  def show_my_routes
    @routes = Route.myRoutes(current_user.id).paginate(:page => params[:page], per_page: 10).order('created_at DESC')
    @countMyRoutes = Route.countMyRoutes(current_user.id)
    render :layout => 'user-layout'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @route = Route.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_params
      params.require(:route).permit(:title, :description, :from_lat, :from_lng, :to_lat, :to_lng, :waypoints, :departure, :cost, :id_user, :car)
    end
end
