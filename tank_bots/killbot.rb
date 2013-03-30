class Killbot < RTanque::Bot::Brain
	NAME = 'Killbot'
	include RTanque::Bot::BrainHelper

	GO =
		[RTanque::Heading::N,
    	RTanque::Heading::S,
    	RTanque::Heading::E,
    	RTanque::Heading::W,
    	RTanque::Heading::NE,
    	RTanque::Heading::SE,
    	RTanque::Heading::NW,
    	RTanque::Heading::SW]

  AIMS = [RTanque::Heading::N,
    	RTanque::Heading::S,
    	RTanque::Heading::E,
    	RTanque::Heading::W,
    	RTanque::Heading::NE,
    	RTanque::Heading::SE,
    	RTanque::Heading::NW,
    	RTanque::Heading::SW]

	TIMER = 100
	SHOTS = 4
	def initialize(arena)
		@direction_cycle = GO.shuffle.cycle
		@arena = arena
		@heading = GO.shuffle!.first
		@speed = 20
		@buffer = 5
		@timer = 0
		@shoter = 0
		@off = 0
		@target = AIMS.shuffle!.last
	end

	def tick!
		check_for_timer
		shot_timer
		command.fire
		command.fire
		command.fire
		command.heading = @heading
		command.speed = @speed
		#command.radar_heading = @target # RTanque::Heading
    command.turret_heading = @heading#@target # RTanque::Heading
	end

	def change_heading
		@heading = GO.shuffle!.first
	end

	def change_target
	@target = AIMS.shuffle!.first
=begin		if @off <= 7
		@target = AIMS[@off]
		@off +=1
		else
			@off = 0
		end
=end
	end

	def shot_timer
		if sensors.health < 101
			@shoter += 1
			if @shoter > SHOTS
				change_target
				@shoter = 0
			end
		end
	end

	def check_for_timer
		if sensors.health < 101
			@timer += 1
			if @timer > TIMER
				change_heading
				@timer = 0
			end	

		end
	end	
 end
