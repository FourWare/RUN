# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
    user = User.new
    
    user.assign_attributes({ 
        :name => Faker::Name.name, 
        :nick => Faker::Name.first_name, 
        :career => Faker::University.name, 
        :email => Faker::Name.first_name + '@unal.edu.co', 
        :password => '123456' 
    })
    user.save!
end
