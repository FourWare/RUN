class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /routes
  # GET /routes.json
  def index1
    @routes = Route.othersRoutes.paginate(:page => params[:page], per_page: 10).order('created_at DESC')
    @countOtherRoutes = Route.countOtherRoutes(current_user.id)
    @countRoutesFilter = @routes.count
  end
  
  def index
    #@routes = Route.othersRoutes(current_user.id).paginate(:page => params[:page], per_page: 10).order('created_at DESC')
    @routes = Route.filterSearchOtherRoutes(params[:sKeyWord], params[:sCost],params[:sDate],params[:sCapacity],params[:sType],params[:sBrand], current_user.id).paginate(:page => params[:page], per_page: 10).order('created_at DESC')
    @countOtherRoutes = Route.countOtherRoutes(current_user.id)
    @countRoutesFilter = Route.countRoutes(@routes)
    render :layout => 'user-layout'
  end
  
  def show_my_routes
    @routes = Route.filterSearchMyRoutes(params[:sKeyWord], params[:sCost],params[:sDate],params[:sCapacity],params[:sType],params[:sBrand], current_user.id).paginate(:page => params[:page], per_page: 10).order('created_at DESC')
    @countMyRoutes = Route.countMyRoutes(current_user.id)
    @countRoutesFilter = Route.countRoutes(@routes)
    render :layout => 'user-layout'
  end

  # GET /routes/1
  # GET /routes/1.json
  
  def show
    @extraInfoRouteConductor =  Route.extraInfoRouteConductor(@route.id_user)
    @extraInfoRoute = Route.extraInfoRoute(@route.car_placa)
    @usersInRoute = Route.usersInRoute(@route.id)
    @myRating = Route.getMyRating(@route.id, current_user.id)
    @countUsersRating = Route.countUsersRating(@route.id)
    @countStar1 = Route.countStars(@route.id, 1)
    @countStar2 = Route.countStars(@route.id, 2)
    @countStar3 = Route.countStars(@route.id, 3)
    @countStar4 = Route.countStars(@route.id, 4)
    @countStar5 = Route.countStars(@route.id, 5)
    
    #------------------------------------------------------------------------------------------------------------------
    
    @spacesProbability = Route.spacesProbability(current_user.id)
    @z = @spacesProbability
    @totalA= @spacesProbability.sum.to_f
    @m = [0.005879880814,	0.0264594669,	0.2116757576,	0.5291894233,	0.2267954714, 0]
    @matriz = [[0,(@z[1]+@z[2]+@z[3]+@z[4])/@totalA,0,0,0],[0,0,(@z[2]+@z[3]+@z[4])/@totalA,0,0],[0,0,0,(@z[3]+@z[4])/@totalA,0],[0,0,0,0,@z[4]/@totalA],[0,0,0,0.3,0.7]]
    @matriz[0][0] = 1 - @matriz[0].sum
    if(@matriz[1].sum<=0.9)
      @matriz[1][0] = 0.1
      @matriz[1][1] = 1 - @matriz[1].sum
    else
      @matriz[1][0] = 1 - @matriz[1].sum
    end
    
    if(@matriz[2].sum<=0.9)
      @matriz[2][1] = 0.1
      @matriz[2][2] = 1 - @matriz[2].sum
    else
      @matriz[2][1] = 1 - @matriz[2].sum
    end
    
    if(@matriz[3].sum <=0.8)
      @matriz[3][2] = 0.2
      @matriz[3][3] = 1 - @matriz[3].sum
    else
      @matriz[3][2] = 1 - @matriz[3].sum
    end

    @matrix = Matrix[*@matriz] ** 16
    
    @i =  4 - @usersInRoute.split(", ").size
    @toshow = @matrix[4, @i]
    @toshow = @toshow * 100
    @toshow = @toshow.round
    
    
    #------------------------------------------------------------------------------------------------------------------
    
    if(@countUsersRating != 0)
      @barWidth1 = (@countStar1*100)/@countUsersRating
      @barWidth2 = (@countStar2*100)/@countUsersRating
      @barWidth3 = (@countStar3*100)/@countUsersRating
      @barWidth4 = (@countStar4*100)/@countUsersRating
      @barWidth5 = (@countStar5*100)/@countUsersRating
    else
      @barWidth1 = 0
      @barWidth2 = 0
      @barWidth3 = 0
      @barWidth4 = 0
      @barWidth5 = 0
    end
    @commentsSplit = Route.commentsSplit(@route.id)
    @averageRating = Route.averageRating(@route.id)
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
    redirect_to controller: 'routes', action: 'show', id: params[:id_route]
  end
  
  def updateRatings
    @ruta = params[:route]
    if(params[:act] == "add" and (Route.checkUserInRatingRoute(params[:route], params[:user]) == false))
      Route.addRatingsInRoute(params[:route], params[:user], params[:value])
    elsif(params[:act] == "remove" and Route.checkUserInRatingRoute(params[:route], params[:user]))
      Route.removeRatingsInRoute(params[:route], params[:user])
    end
    redirect_to controller: 'routes', action: 'show', id: params[:route]
  end
  
  def updateComments
    if( Route.isNotCommentNil((params[:route][:last_comment]).to_s) )
      Route.updateComments(params[:routeId], current_user.id, params[:route][:last_comment])
    end
    redirect_to controller: 'routes', action: 'show', id: params[:routeId]
  end

  # GET /routes/new
  def new
    @route = Route.new
    @myCars = Route.myCars(current_user.id)
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
      params.require(:route).permit(:title, :description, :from_lat, :from_lng, :to_lat, :to_lng, :waypoints, :departure, :cost, :id_user, 
                                    :car_placa, :spaces_available, :users_in_route, :ratings, :userRating, :comments)
    end
end
