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
    east:
    [
      RTanque::Heading::W,
      RTanque::Heading::NW,
      RTanque::Heading::SW
    ],
    west:
    [
      RTanque::Heading::E,
      RTanque::Heading::NE,
      RTanque::Heading::SE

    ],
    north:
    [
      RTanque::Heading::S,
      RTanque::Heading::SE,
      RTanque::Heading::SW

    ],
    south:
    [
      RTanque::Heading::N,
      RTanque::Heading::NE,
      RTanque::Heading::NW
    ]
  }

  BORED_MAX_COUNT = 100

  def initialize(arena)
    @arena = arena
    # @direction_cycle = DIRECTIONS.shuffle.cycle
    # @heading = RTanque::Heading.new @direction_cycle.next
    @heading = DIRECTIONS.shuffle!.first
    @speed = 5
    @buffer = 5
    @bored_count = 0
  end

  def tick!
    check_for_wall
    check_for_open_air
    check_for_bored
    command.heading = @heading
    command.speed = @speed
    # puts sensors.position.x.to_s + ',' + sensors.position.y.to_s
    # puts arena.width.to_s + ',' + arena.height.to_s
  end

  def check_for_wall
    return if @wall

    unless @buffer_right
      @buffer_right = arena.width - @buffer
      @buffer_bottom = arena.height - @buffer
    end

    if sensors.position.x < @buffer
      @wall = :west
    elsif sensors.position.x > @buffer_right
      @wall = :east
    elsif sensors.position.y < @buffer
      @wall = :north
    elsif sensors.position.y > @buffer_bottom
      @wall = :south
    else
      @wall = nil

    reverse_heading
    end
  end

  def check_for_open_air

    if sensors.position.x > 1 &&
       sensors.position.x < arena.width - 1 &&
       sensors.position.y > 1 &&
       sensors.position.y < arena.height - 1

      @wall = nil
    end
   end

  def reverse_heading
    return unless @wall
    @heading = OPTIONS[@wall].shuffle.first
    puts @heading
  end

  def check_for_bored
    if @wall
      @bored_count += 1
      if @bored_count > BORED_MAX_COUNT
        puts "BORED at #{@wall}"
        reverse_heading
        @bored_count = 0
      end
    end
  end
end
