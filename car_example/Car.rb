class Car
  NUMBER_OF_WHEELS = 4
  @@number_of_cars = 0
  # MAKE = 'ford'
  
  def initialize(manufacturer, model)
    @manufacturer = manufacturer
    @model = model

    @@number_of_cars += 1
  end

  def report_num_wheels
  	NUMBER_OF_WHEELS
  end

  def report_model
  	puts "your model is #{@model}, and, btw, we've created #{@@number_of_cars} cars"
  end

  def report_manufacturer
  	puts "your manufacturer is #{@manufacturer}"
  end

  def self.how_many
    @@number_of_cars
  end

end