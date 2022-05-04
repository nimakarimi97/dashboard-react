puts 3 > 4 ? 'if true' : 'else' # else will be putted

class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    carsPerHour = 221
    if @speed <= 4
      @successRate = 1
    elsif @speed <= 8
      @successRate = 0.9
    elsif @speed == 10
      @successRate = 0.77
    elsif @speed == 9
      @successRate = 0.8
    end

    @speed * carsPerHour * @successRate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end

puts AssemblyLine.new(6).production_rate_per_hour #=> 1193.4

puts AssemblyLine.new(6).working_items_per_minute
#=> 19
