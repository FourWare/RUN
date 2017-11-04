class Route < ApplicationRecord
    ##### queries
    def self.filterSearchOtherRoutes(keyword, cost, date, capacity, type, brand, user_id)
        results = Route.where(["id_user != ?", user_id]).all
        results = results.where(["(title LIKE ? OR description LIKE ?) AND id_user != ?", '%' + keyword + '%', '%' + keyword + '%', user_id]) if keyword.present?#keyword
        results = results.where(:car_placa => Car.where(:marca => brand.capitalize).select(:placa)).where.not(:id_user => user_id) if brand.present?#brand
        results = results.where(["cost <= ? and id_user != ?", cost, user_id]) if cost.present?#cost
        results = results.where(:car_placa => Car.where(:capacidad => capacity).select(:placa)).where.not(:id_user => user_id) if capacity.present?#capacity
        results = results.where(:car_placa => Car.where(:tipo => type.capitalize).select(:placa)).where.not(:id_user => user_id) if type.present? #tipo de vehiculo
        results = results.where('departure LIKE ?', '%' + date + '%').where.not(:id_user => user_id) if date.present? #fecha
        return results
    end
    
    def self.filterSearchMyRoutes(keyword, cost, date, capacity, type, brand, user_id)
        results = Route.where(["id_user = ?", user_id]).all #rutas del usuario activo
        results = results.where(["(title LIKE ? OR description LIKE ?) AND id_user = ?", '%' + keyword + '%', '%' + keyword + '%', user_id]) if keyword.present?#keyword /
        results = results.where(:car_placa => Car.where(:marca => brand.capitalize).select(:placa)).where(:id_user => user_id) if brand.present?#brand / error not working
        results = results.where(["cost <= ? and id_user = ?", cost, user_id]) if cost.present?#cost /
        results = results.where(:car_placa => Car.where(:capacidad => capacity).select(:placa)).where(:id_user => user_id) if capacity.present?#capacity /
        results = results.where(:car_placa => Car.where(:tipo => type.capitalize).select(:placa)).where(:id_user => user_id) if type.present? #tipo de vehiculo /
        results = results.where('departure LIKE ?', '%' + date + '%').where(:id_user => user_id) if date.present? #fecha /
        return results
    end
    
    def self.checkUserInRoute(route, user)
        Route.find(route).users_in_route.include? (user.to_s + ', ')
    end
    
    def self.addUserToRoute(route, user)
        Route.find(route).update_attribute(:users_in_route, Route.find(route).users_in_route + user.to_s + ', ')
        Route.find(route).update_attribute(:spaces_available, Route.find(route).spaces_available - 1)
    end
    
    def self.removeUserToRoute(route, user)
        Route.find(route).update_attribute(:users_in_route, Route.find(route).users_in_route.remove(user.to_s + ', ', '' ))
        Route.find(route).update_attribute(:spaces_available, Route.find(route).spaces_available + 1)
    end
    
    def self.usersInRoute(route)
        Route.find(route).users_in_route.split(", ")
    end
    
    def self.myRoutes(user_id)
        Route.where(:id_user => user_id)
    end
    
    def self.othersRoutes(user_id)
        Route.where(["id_user != ?", user_id]).all
    end
    
    def self.countMyRoutes(user_id)
        Route.where(:id_user => user_id).count
    end
    
    def self.countOtherRoutes(user_id)
        Route.where.not(:id_user => user_id).count
    end
    
    def self.extraInfoRoute(placa)
        Car.joins(:user).where(:placa => placa).uniq
    end
    
    def self.extraInfoRouteConductor(id)
         User.where(:id => id)
    end
    
    def self.myCars(user_id)
        Car.where(:user_id => user_id).uniq
    end
    
    def self.createdPerDay()
        Route.group("DATE(created_at)").count
    end
    
    def self.createdLastWeek()
        Route.where('created_at >= ?', 1.week.ago).count
    end
end