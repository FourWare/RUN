class Route < ApplicationRecord
    belongs_to :car
    
    ##### queries
    def self.otherRoutes(user_id)
        Route.where.not(:id_user => user_id)
    end
    
    def self.filterSearch(option, search, user_id)
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