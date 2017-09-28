# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Carrer = ["Ingeniería Agronómica","Ingenieria de Sistemas","Artes plásticas","Derecho","Ingenieria Eléctrica",
          "Arquitectura","Cine y Televisión","Diseño Industrial","Música","Música Instrumental",
          "Ingeniería Mecatrónica","Ingeniería Civil","Ingeniería Química","Ingeniería Industrial"," Enfermería"]
         
100.times do
    user = User.new
    
    name = Faker::Name.first_name
    lastname = Faker::Name.last_name
    nick = name + rand(100..999).to_s
    
    user.assign_attributes({ 
        :name => name + " " + lastname, 
        :nick => nick.downcase, 
        :career => Carrer[rand(Carrer.length)],
        :email => nick + "@unal.edu.co", 
        :date_of_birth=> Faker::Date.birthday(15, 67),
        :password => '123456'
    })
    user.save!
end
