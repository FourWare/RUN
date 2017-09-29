# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Carreras = ["Ingeniería Sistemas y Computación", "Ingeniería eléctrica", "Ingeniería mecánica", "Medicina", 
                "Artes plásticas", "Música", "Agronomía", "Derecho", "Ciencias económicas", "Biología"]

100.times do
    user = User.new
    
    name = Faker::Name.first_name
    lastname = Faker::Name.last_name
    nick = name + rand(1..999).to_s
    
    user.assign_attributes({ 
        :name => name + lastname, 
        :nick => nick, 
        :career => Carreras.sample,
        :email => nick + '@unal.edu.co', 
        :password => '123456' 
    })
    user.save!
end
