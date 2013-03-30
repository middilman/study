class Car
  # STATIC variable
  @@car_count = 0

  def initialize(num_wheels)
    @num_wheels = num_wheels
    @@car_count += 1
    $vehicle_count += 1
  end

  def wheel_count
    @num_wheels
  end

  def wheel_count=  (number)
    @num_wheels = number
  end

  def self.vehicle_count
    @@car_count
  end
end



class Bike
  # STATIC variable
  @@bike_count = 0
end


# GLOBAL variable!
$vehicle_count = 0



bmw = Car.new 4

# TODO: refactor all the "puts" into one "status" method
puts "bmw has #{bmw.wheel_count} wheels."

bmw.wheel_count = 40

puts "bmw has #{bmw.wheel_count} wheels."
puts "we have #{Car.car_count} cars"
puts "we have #{Bike.car_count} bikes"
puts "we have #{$vehicle_count} vehicles"





# TODO: separate classes into their own files
# TODO: create parent "Vehicle" class
#       - get vehicle_count out of the global scope
#       - create _count_, _speed_,  method,
