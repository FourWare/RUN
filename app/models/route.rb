class Route < ApplicationRecord
    ##### queries
    def self.filterSearchOtherRoutes(option, search, user_id)
        if (search != "" and search != " ")
            if(option == "type")
                where(:car_placa => Car.where(:tipo => search.capitalize).select(:placa)).where.not(:id_user => user_id)
            elsif(option == "brand")
                where(:car_placa => Car.where(:marca => search.capitalize).select(:placa)).where.not(:id_user => user_id)
            elsif(option == "color")
                where(:car_placa => Car.where(:color => search.capitalize).select(:placa)).where.not(:id_user => user_id)
            elsif(option == "capacity")
                where(:car_placa => Car.where(:capacidad => search).select(:placa)).where.not(:id_user => user_id)
            elsif(option == "date")
                where('departure LIKE ?', '%' + search + '%').where.not(:id_user => user_id)
            elsif(option == "cost")
                where(["cost = ? and id_user != ?", search, user_id])
            elsif(option == "keyWord")
                where(["(title LIKE ? OR description LIKE ?) AND id_user != ?", '%' + search + '%', '%' + search + '%', user_id])
            else
                where(["id_user != ?", user_id]).all
            end
        else
            where(["id_user != ?", user_id]).all
        end
    end
    
    def self.filterSearchMyRoutes(option, search, user_id)
        if (search != "" and search != " ")
            if(option == "type")
                where(:car_placa => Car.where(:tipo => search.capitalize).select(:placa)).where(:id_user => user_id)
            elsif(option == "brand")
                where(:car_placa => Car.where(:marca => search.capitalize).select(:placa)).where(:id_user => user_id)
            elsif(option == "color")
                where(:car_placa => Car.where(:color => search.capitalize).select(:placa)).where(:id_user => user_id)
            elsif(option == "capacity")
                where(:car_placa => Car.where(:capacidad => search).select(:placa)).where(:id_user => user_id)
            elsif(option == "date")
                where('departure LIKE ?', '%' + search + '%').where(:id_user => user_id)
            elsif(option == "cost")
                where(["cost = ? and id_user = ?", search, user_id])
            elsif(option == "keyWord")
                where(["(title LIKE ? OR description LIKE ?) AND id_user = ?", '%' + search + '%', '%' + search + '%', user_id])
            else
                where(["id_user = ?", user_id]).all
            end
        else
            where(["id_user = ?", user_id]).all
        end
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