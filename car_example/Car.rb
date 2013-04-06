class Car
  NUMBER_OF_WHEELS = 4
  # MAKE = 'ford'
  
  def initialize(manufacturer, model)
    @manufacturer = manufacturer
    @model = model
  end

  def report_num_wheels
  	NUMBER_OF_WHEELS
  end

  def report_model
  	puts "your model is #{@model}"
  end

  def report_manufacturer
  	puts "your manufacturer is #{@manufacturer}"
  end
end
