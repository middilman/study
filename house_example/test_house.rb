require './House.rb'

$is_raining = false

house_1 = House.new
house_2 = House.new
house_3 = House.new

house_1.roof_color = 'red'
house_1.number_of_storeys = 1 
house_1.number_of_people = 1 

house_2.roof_color = 'blue'
house_2.number_of_storeys = 2 
house_2.number_of_people = 2 

house_3.roof_color = 'green'
house_3.number_of_storeys = 3 
house_3.number_of_people = 3 

roof_string="roofs 1: #{house_1.roof_color} 2: #{house_2.roof_color} 3: #{house_3.roof_color}"

storey_string="storeys one: #{house_1.number_of_storeys} two: #{house_2.number_of_storeys} three: #{house_3.number_of_storeys}"

people_string="people one: #{house_1.number_of_people} two: #{house_2.number_of_people} three: #{house_3.number_of_people}"

puts roof_string
puts storey_string
puts people_string



