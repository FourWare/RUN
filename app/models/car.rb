class Car < ApplicationRecord
    mount_uploader :image, ImageCarUploader
    belongs_to :user

    def self.countCars(user_id)
        Car.where(:user_id => user_id).count
    end
    
    def self.cars(user_id)
        Car.where(:user_id => user_id).all
    end
    
    def self.user(user_id)
        User.find(user_id)
    end
    
    def self.carsPerYear()
        Car.group("modelo").count
    end
    
    def self.perType()
        Car.group("tipo").count
    end
end
