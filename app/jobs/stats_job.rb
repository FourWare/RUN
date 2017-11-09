class StatsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    @routes = Route.routesPerDay2
    @users = User.createdPerDay2
    @cars = 1
    @bikes = 1
    @usersInRoutes = Route.usersInRoutes
    
    stats = Statistic.new
    stats.assign_attributes({ 
        :routes_per_day => @routes, 
        :users_created_per_day => @users, 
        :cars_per_day => @cars,
        :bikes_per_day => @bikes,
        :users_in_routes_per_day => @usersInRoutes
    })
    stats.save!
  end
end
