class Roomba < RTanque::Bot::Brain
  NAME = 'roomba'
  include RTanque::Bot::BrainHelper
  DIRECTIONS = [
    RTanque::Heading::N,
    RTanque::Heading::S,
    RTanque::Heading::E,
    RTanque::Heading::W,
    RTanque::Heading::NE,
    RTanque::Heading::NW,
    RTanque::Heading::SE,
    RTanque::Heading::SW]

  OPTIONS = {
    e:
    [
      RTanque::Heading::W,
      RTanque::Heading::NW,
      RTanque::Heading::SW
    ],
    w:
    [
      RTanque::Heading::E,
      RTanque::Heading::NE,
      RTanque::Heading::SE
    ],
    n:
    [
      RTanque::Heading::S,
      RTanque::Heading::SE,
      RTanque::Heading::SW
    ],
    s:
    [
      RTanque::Heading::N,
      RTanque::Heading::NE,
      RTanque::Heading::NW
    ],
    nw:
    [
      RTanque::Heading::SE
    ],
    ne:
    [
      RTanque::Heading::SW
    ],
    sw:
    [
      RTanque::Heading::NE
    ],
    se:
    [
      RTanque::Heading::NW
    ]
  }

  BUFFER = 5

  def initialize(arena)
    @arena = arena
    # @direction_cycle = DIRECTIONS.shuffle.cycle
    # @heading = RTanque::Heading.new @direction_cycle.next
    @heading = DIRECTIONS.shuffle!.first
    @speed = 5
    @last_bored_location = nil
    @wall = nil
  end

  def tick!
    unless @buffer_right
      @buffer_right = arena.width - BUFFER
      @buffer_bottom = arena.height - BUFFER
    end

    locate
    check_for_bored
    command.heading = @heading
    command.speed = @speed
    # puts sensors.position.x.to_s + ',' + sensors.position.y.to_s
    # puts arena.width.to_s + ',' + arena.height.to_s
  end

  def locate
    puts "CORN: #{@corner} .. #{@wall}"

    if sensors.position.x > BUFFER &&
      sensors.position.x < @buffer_right &&
      sensors.position.y > BUFFER &&
      sensors.position.y < @buffer_bottom

      @last_bored_location = nil
      @corner = nil
      @wall = nil
    end

    return if @corner or @wall

    if sensors.position.x < BUFFER
      puts 'WEST'
      if sensors.position.y < BUFFER
        @corner = :nw
      elsif sensors.position.y > @buffer_bottom
        @corner = :sw
      else
        @wall = :w
      end
    elsif sensors.position.x > @buffer_right
      puts 'EAST'
      if sensors.position.y < BUFFER
        @corner = :ne
      elsif sensors.position.y > @buffer_bottom
        @corner = :se
      else
        @wall = :e
      end
    elsif sensors.position.y < BUFFER
      puts 'SOUTH'
      @wall = :s
    elsif sensors.position.y > @buffer_bottom
      puts 'NORTH'
      @wall = :n
    else
      @wall = nil
    end
    puts "wall: #{@wall} #{sensors.position.x},#{sensors.position.y}" if @wall
  end

  def reverse
    puts @last_bored_location
    return unless @last_bored_location
    @heading = OPTIONS[@last_bored_location].shuffle.first
    puts "reverse heading to #{@heading}"
  end

  def check_for_bored
    if @corner and @corner != @last_bored_location
      puts "BORED at #{@corner}"
      @last_bored_location = @corner
      reverse
      @corner = nil
    elsif @wall and @wall != @last_bored_location
      puts "BORED at #{@wall}"
      @last_bored_location = @wall
      reverse
      @wall = nil
    else
      puts @wall
    end
  end
end
