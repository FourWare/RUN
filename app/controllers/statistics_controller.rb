class StatisticsController < ApplicationController
  before_action :set_statistic, only: [:show, :edit, :update, :destroy]

  # GET /statistics
  # GET /statistics.json
  def index
    @countUsers = User.countUsers()
    @countRoutes = Route.countRoutes(Route.all)
    @countVehicles = Car.totalCars()
    @routesLastWeek = Route.createdLastWeek
    @routesCreatedPerDay = Statistic.routesAllDays
    @usersCreatedPerDay = Statistic.usersAllDays
    @carsUsedPerDay = Statistic.carsAllDays
    @bikesUsedPerDay = Statistic.bikesAllDays
    @usersInRoutesPerDay = Statistic.usersInAllRoutes
    
    respond_to do |format|
      format.html {render layout: 'admin_layout' }
      format.pdf { render template: 'statistics/pdf_statistics',javascript_delay: 3000, pdf:'pdf', layout: 'pdf_statistics.html',header: { right: '[page] of [topage]'}}
    end
  end
  

    

  # GET /statistics/1
  # GET /statistics/1.json
  def show
  end

  # GET /statistics/new
  def new
    @statistic = Statistic.new
  end

  # GET /statistics/1/edit
  def edit
  end

  # POST /statistics
  # POST /statistics.json
  def create
    @statistic = Statistic.new(statistic_params)

    respond_to do |format|
      if @statistic.save
        format.html { redirect_to @statistic, notice: 'Statistic was successfully created.' }
        format.json { render :show, status: :created, location: @statistic }
      else
        format.html { render :new }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statistics/1
  # PATCH/PUT /statistics/1.json
  def update
    respond_to do |format|
      if @statistic.update(statistic_params)
        format.html { redirect_to @statistic, notice: 'Statistic was successfully updated.' }
        format.json { render :show, status: :ok, location: @statistic }
      else
        format.html { render :edit }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statistics/1
  # DELETE /statistics/1.json
  def destroy
    @statistic.destroy
    respond_to do |format|
      format.html { redirect_to statistics_url, notice: 'Statistic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statistic
      @statistic = Statistic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def statistic_params
      params.require(:statistic).permit(:routes_per_day, :users_created_per_day, :cars_per_day, :bikes_per_day, :users_in_routes_per_day)
    end
end
