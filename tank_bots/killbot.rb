class Killbot < RTanque::Bot::Brain
	NAME = 'Killbot'
	include RTanque::Bot::BrainHelper

	CORNERS = [:NW, :NE, :SE, :SW]
	TURRET_FIRE_RANGE = RTanque::Heading::ONE_DEGREE * 1.5

	def tick!
		if sensors.health < 10
			!dead
		end
		command.heading = 2* Math::PI 
		command.radar_heading = 2* Math::PI 
		command.turret_heading = 2* Math::PI 
		command.fire(17)
=begin
		if self.position == on_top_wall
			command.speed = 3
			command.heading = 20
			command.radar_heading =  -Math::PI / 2.0
			command.turret_heading = -Math::E / 2.0
			command.fire(17)
		elsif self.position == on_bottom_wall
			command.speed = 3
			command.heading = 20
			command.radar_heading ==  -10
			command.turret_heading = -10
			command.fire(17)
		elsif self.position == on_left_wall
			command.speed = 1
			command.heading = 20
			command.radar_heading = 10
			command.turret_heading = 10
			command.fire(17)
		else
			command.speed = 10
			command.heading = 20
			command.radar_heading =  -Math::PI / 2.0
			command.turret_heading = -Math::E / 2.0
			command.fire(3)
		end

=end
	end

	def corner=(corner_name)
    @corner = case corner_name
      when :NE
        [self.arena.width, self.arena.height]
      when :SE
        [self.arena.width, 0]
      when :SW
        [0, 0]
      else
        [0, self.arena.height]
    end
  end

  def corner
  	@corner
  end

	

  end
