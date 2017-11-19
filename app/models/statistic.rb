class Statistic < ApplicationRecord
    
    
    def self.routesAllDays()
        Statistic.pluck(:routes_oer_day)
    end
    
    def self.usersAllDays()
        Statistic.pluck(:users_created_per_day)
    end
    
    def self.carsAllDays()
        Statistic.pluck(:cars_per_day)
    end
    
    def self.bikesAllDays()
        Statistic.pluck(:bikes_per_day)
    end
    
    def self.usersInAllRoutes()
        Statistic.pluck(:users_in_routes_per_day)
    end
    
end
