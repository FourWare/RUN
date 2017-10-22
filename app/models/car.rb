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
end
