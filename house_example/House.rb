# create a blueprint for a house object
class House
  attr_accessor :number_of_people, :number_of_storeys, :roof_color

  def should_we_turn_off_the_sprinklers
    puts $is_raining
  end
end
