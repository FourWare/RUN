require 'test_helper'

class CarTest < ActiveSupport::TestCase
   def carJoinUser()
        Car.joins(:user).uniq
    end
    
    def totalCars()
        Car.count
    end
    
   test "test totalCars" do
     assert_equal 2,totalCars()
     #print "hola"
   end
   
   test "test JoinCars" do
     assert carJoinUser()
     #
   end
    
end
