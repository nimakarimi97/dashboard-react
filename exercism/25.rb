class Clock
  attr_reader :array
  def initialize(hour: 0, minute: 0)
    hour = (hour + minute / 60) % 24
    minute = minute % 60
    @array = [hour, minute]
  end

  def to_s
    "#{format('%02d', array[0])}:#{format('%02d', array[1])}"
  end

  def +(obj)
    sum = array.zip(obj.array).map(&:sum)
    Clock.new(hour: sum[0], minute: sum[1]).to_s
  end

  def -(obj)
    subtract = array.zip(obj.array).map { |a, b| a - b }
    Clock.new(hour: subtract[0], minute: subtract[1]).to_s
  end

  def ==(obj)
    array == obj.array
    #* or
    # to_s == obj.to_s
  end
end

p Clock.new(hour: 23, minute: 66).to_s
p Clock.new(minute: 200).to_s

clock = Clock.new(hour: 2, minute: 45)
(clock + Clock.new(minute: 40)).to_s

clock = Clock.new(hour: 10, minute: 3)
(clock - Clock.new(minute: 3)).to_s

clock1 = Clock.new(hour: 10, minute: 37)
clock2 = Clock.new(hour: 34, minute: 37)

p clock1 == clock2

clock1 = Clock.new(hour: 14, minute: 37)
clock2 = Clock.new(hour: 15, minute: 37)
p clock1 == clock2
