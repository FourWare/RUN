class Route < ApplicationRecord
    #-------------------------------- queries -------------------------#
    
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
        results = results.where('departure BETWEEN ? AND ?', DateTime.parse(date), DateTime.parse(date)+1).where(:id_user => user_id) if date.present? #fecha /
        return results
    end
    
    def self.checkUserInRoute(route, user)
        a = Route.find(route).users_in_route
        b = a.split(", ")
        b.include? (user.to_s)
    end
    
    def self.addUserToRoute(route, user)
        Route.find(route).update_attribute(:users_in_route, Route.find(route).users_in_route + user.to_s + ', ')
        Route.find(route).update_attribute(:spaces_available, Route.find(route).spaces_available - 1)
    end
    
    def self.removeUserToRoute(route, user)
        a = Route.find(route).users_in_route
        b = a.split(", ")
        b.delete_at(b.index(user.to_s))
        c = ""
        b.each do |u|
            c = c + u + ", "
        end
        Route.find(route).update_attribute(:users_in_route, c)
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
    
    def self.routesPerDay()
        Route.group("DATE(departure) = ?", Date.today-1).count
    end
    
    def self.routesPerDay2()
        Route.where("DATE(departure) = ?", Date.today-1).count
    end
    
    def self.usersInRoutes()
        total = 0
        routes = Route.where("DATE(departure) = ?", Date.today-1)
        routes.each do |x|
            total += x.users_in_route.split(",").size
        end
        return total
    end
    
    def self.createdLastWeek()
        Route.where('created_at >= ?', 1.week.ago).count
    end
    
    def self.countRoutes(routes)
        routes.count
    end
   
    # -------------------- Funciones para la calificación de ruta ------------------------------------- #
    
    def self.checkUserInRatingRoute(route, user)
        Route.find(route).userRating.split(", ").include? user.to_s
    end
   
    def self.addRatingsInRoute(route, user, value)
        if(value == '1' or value == '2' or value == '3' or value == '4' or value == '5')
            Route.find(route).update_attribute(:userRating, Route.find(route).userRating + user.to_s + ", ")
            Route.find(route).update_attribute(:ratings, Route.find(route).ratings + value + ", ")
        end
    end
    
    def self.removeRatingsInRoute(route, user)
        userRatingSplit = Route.find(route).userRating.split(", ")
        ratingsSplit = Route.find(route).ratings.split(", ")
        userIndex = userRatingSplit.index(user.to_s)
        userRatingSplit.delete_at(userIndex)
        ratingsSplit.delete_at(userIndex)
        newUserRating = ""
        newRatings = ""
        userRatingSplit.each do |a|
            newUserRating = newUserRating + a + ", "
        end
        ratingsSplit.each do |b|
            newRatings = newRatings + b + ", "
        end
        
        Route.find(route).update_attribute(:userRating, newUserRating)
        Route.find(route).update_attribute(:ratings, newRatings)
    end
    
    def self.getMyRating(route, user)
        userRatingSplit = Route.find(route).userRating.split(", ")
        ratingsSplit = Route.find(route).ratings.split(", ")
        userIndex = userRatingSplit.index(user.to_s)
        if(userIndex == nil)
            return "-"
        else
            return ratingsSplit[userIndex]
        end
    end
    
    def self.countUsersRating(route)
        userRatingSplit = Route.find(route).userRating.split(", ")
        return userRatingSplit.size
    end
    
    def self.countStars(route, option)
        ratingsSplit = Route.find(route).ratings.split(", ")
        return ratingsSplit.count(option.to_s)
    end
    
    def self.averageRating(route)
        numUsersRating = countUsersRating(route)
        if(numUsersRating != 0)
            a = 0
            Route.find(route).ratings.split(", ").each do |r|
                a += r.to_f
            end
            return ((a/numUsersRating).round(1)).to_s
        else
            return "-"
        end
    end

    # -------------------- Funciones para los comentarios de ruta ------------------------------------- #
    
    def self.isNotCommentNil(comment)
        (comment.count("a-zA-Z") > 0) ? true : false
    end
    
    def self.updateComments(route, user, comment)
        Route.find(route).update_attribute(:comments,  "//commentA1B2C3//" + user.to_s + "//A1B2C3//" + comment + + "//A1B2C3//" + Time.now.strftime("%d/%m/%Y") +  Route.find(route).comments )
    end
    
    def self.commentsSplit(route)
        Route.find(route).comments.split("//commentA1B2C3//")
    end
end