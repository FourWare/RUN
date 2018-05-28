# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Carreras = ["Ingeniería Sistemas y Computación", "Ingeniería eléctrica", "Ingeniería mecánica", "Medicina", 
#                "Artes plásticas", "Música", "Agronomía", "Derecho", "Ciencias económicas", "Biología"]

=begin
30.times do
    user = User.new
    
    name = Faker::Name.first_name
    lastname = Faker::Name.last_name
    nick = name + rand(1..999).to_s
    
    user.assign_attributes({ 
        :name => name + lastname, 
        :nick => nick, 
        :career => Carreras.sample,
        :date_of_birth => Faker::Date.birthday(15, 50),
        :email => nick + '@unal.edu.co', 
        :password => '123456' 
    })
    user.save!
end
=end

users = ["", "2", "3", "4", "5"]

2.times do
    a = rand(0..4)
    uir = a
    users_in_route = ""
    while uir > 0 do
        users_in_route = users_in_route + users[uir] + ", "
        uir = uir - 1
    end
    
    route = Route.new
    route.assign_attributes({
        :title => "Universidad - Fontibon", 
        :description => "Esta ruta va desde la universidad hasta fontibón", 
        :from_lat => 4.63489659999999, 
        :from_lng => -74.08221349999997, 
        :to_lat => 4.672596299999999, 
        :to_lng => -74.14561170000002, 
        :waypoints => "[]", 
        :departure => "2018-05-21 09:00:00", 
        "cost" => "1900",
        :id_user => 13,
        :car_placa => "AAA-123", 
        :spaces_available => 4 - a, 
        :users_in_route => users_in_route, 
        :ratings => "", 
        :userRating => "", 
        :comments => ""
    })
    route.save!
end

2.times do
    a = rand(0..4)
    uir = a
    users_in_route = ""
    while uir > 0 do
        users_in_route = users_in_route + users[uir] + ", "
        uir = uir - 1
    end
    
    route = Route.new
    route.assign_attributes({
        :title => "Universidad - Fontibon", 
        :description => "Esta ruta va desde la universidad hasta fontibón", 
        :from_lat => 4.63489659999999, 
        :from_lng => -74.08221349999997, 
        :to_lat => 4.672596299999999, 
        :to_lng => -74.14561170000002, 
        :waypoints => "[]", 
        :departure => "2018-05-22 09:00:00", 
        "cost" => "1900",
        :id_user => 13,
        :car_placa => "AAA-123", 
        :spaces_available => 4 - a, 
        :users_in_route => users_in_route, 
        :ratings => "", 
        :userRating => "", 
        :comments => ""
    })
    route.save!
end

2.times do
    a = rand(0..4)
    uir = a
    users_in_route = ""
    while uir > 0 do
        users_in_route = users_in_route + users[uir] + ", "
        uir = uir - 1
    end
    
    route = Route.new
    route.assign_attributes({
        :title => "Universidad - Fontibon", 
        :description => "Esta ruta va desde la universidad hasta fontibón", 
        :from_lat => 4.63489659999999, 
        :from_lng => -74.08221349999997, 
        :to_lat => 4.672596299999999, 
        :to_lng => -74.14561170000002, 
        :waypoints => "[]", 
        :departure => "2018-05-23 09:00:00", 
        "cost" => "1900",
        :id_user => 13,
        :car_placa => "AAA-123", 
        :spaces_available => 4 - a, 
        :users_in_route => users_in_route, 
        :ratings => "", 
        :userRating => "", 
        :comments => ""
    })
    route.save!
end

2.times do
    a = rand(0..4)
    uir = a
    users_in_route = ""
    while uir > 0 do
        users_in_route = users_in_route + users[uir] + ", "
        uir = uir - 1
    end
    
    route = Route.new
    route.assign_attributes({
        :title => "Universidad - Fontibon", 
        :description => "Esta ruta va desde la universidad hasta fontibón", 
        :from_lat => 4.63489659999999, 
        :from_lng => -74.08221349999997, 
        :to_lat => 4.672596299999999, 
        :to_lng => -74.14561170000002, 
        :waypoints => "[]", 
        :departure => "2018-05-24 09:00:00", 
        "cost" => "1900",
        :id_user => 13,
        :car_placa => "AAA-123", 
        :spaces_available => 4 - a, 
        :users_in_route => users_in_route, 
        :ratings => "", 
        :userRating => "", 
        :comments => ""
    })
    route.save!
end

2.times do
    a = rand(0..4)
    uir = a
    users_in_route = ""
    while uir > 0 do
        users_in_route = users_in_route + users[uir] + ", "
        uir = uir - 1
    end
    
    route = Route.new
    route.assign_attributes({
        :title => "Universidad - Fontibon", 
        :description => "Esta ruta va desde la universidad hasta fontibón", 
        :from_lat => 4.63489659999999, 
        :from_lng => -74.08221349999997, 
        :to_lat => 4.672596299999999, 
        :to_lng => -74.14561170000002, 
        :waypoints => "[]", 
        :departure => "2018-05-25 09:00:00", 
        "cost" => "1900",
        :id_user => 13,
        :car_placa => "AAA-123", 
        :spaces_available => 4 - a, 
        :users_in_route => users_in_route, 
        :ratings => "", 
        :userRating => "", 
        :comments => ""
    })
    route.save!
end