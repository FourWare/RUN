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
    
    def self.findByColor(color)
        Car.joins(:user).where(:color => color).uniq
    end
    
    def self.findByBrand(marca)
        Car.joins(:user).where(:marca => marca).uniq
    end 
    
    def self.findByCapacity(capacidad)
        Car.joins(:user).where(:capacidad => capacidad).uniq
    end 
    
    def self.findByType(tipo)
        Car.joins(:user).where(:tipo => tipo).uniq
    end
    
    def self.findByCost(costo)
        Route.where(:cost => costo)
    end
end