# create a blueprint for a house object
class House
  attr_reader :number_of_people
  attr_writer :number_of_people

  def should_we_turn_off_the_sprinklers
    puts $is_raining
  end

  def roof_color
    @roof_color
  end

  def roof_color= (color)
    @roof_color = color
  end

  def number_of_storeys
    @number_of_storeys
  end

  def number_of_storeys= (num)
    @number_of_storeys = num
  end

end
