class Route < ApplicationRecord
    ##### queries
    def self.otherRoutes(user_id)
        Route.where.not(:id_user => user_id)
    end
    
    def self.myRoutes(user_id)
        Route.where(:id_user => user_id)
    end
    
    def self.countMyRoutes(user_id)
        Route.where(:id_user => user_id).count
    end
    
    def self.countRoutes(user_id)
        Route.where.not(:id_user => user_id).count
    end
    
    def self.extraInfoRoute(placa)
        Car.joins(:user).where(:placa => placa).uniq
    end
    
    def self.myCars(user_id)
        Car.where(:user_id => user_id).all
    end
end