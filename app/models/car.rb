class Car < ApplicationRecord
    #----------------------- validaciones para usuarios ----------------------
    validates :placa, :tipo, :modelo, :marca, :color, :capacidad, presence: true
    validates :modelo, :capacidad, :numericality => {:only_integer => true, message: "debe ser numérico."}
    validates_format_of :placa, with: /[A-Z][A-Z][A-Z]-[0-9][0-9][0-9]/, message: 'debe tener un formato como AAA-111 (sin espacios y en mayúsculas).', 
                            :if => "tipo == 'Carro'"
    validates_format_of :placa, with: /[A-Z][A-Z][A-Z]-[0-9][0-9][A-Z]/, message: 'debe tener un formato como AAA-11A (sin espacios y en mayúsculas).', 
                            :if => "tipo == 'Moto'"
    validates_length_of :placa, :minimum => 7, :maximum => 7, message: 'debe tener un formato correcto.'
    validates_uniqueness_of :placa, message: 'ya existe en el sistema.'
    validates_inclusion_of :tipo, :in => ["Carro", "Moto"], message: 'de vehículo no es correcto.'
    validates :modelo, :length => { :minimum => 4, :maximum => 4, message: 'debe ser un número de 4 dígitos.' }
    validates_format_of :marca, with: /[a-zA-Z0-9 ]+/, message: 'debe ser válido (ej: Renault, Mazda).'
    validates_format_of :color, with: /[a-zA-Z ]+/, message: 'debe ser válido (ej: Rojo, Negro).'
    #-------------------------------------------------------------------------
    
    
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
    
    def self.carJoinUser()
        Car.joins(:user).uniq
    end
    
    def self.totalCars()
        Car.count
    end
end
