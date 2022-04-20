class Clock
  def initialize(hour: 0, minute: 0)
    while minute > 59
      hour = hour + 1
      minute = minute - 60
    end
    while minute < 0
      hour = hour - 1
      minute = minute + 60
    end

    @array = [hour % 24, minute]
  end

  def to_s
    "#{format('%02d', @array[0])}:#{format('%02d', @array[1])}"
  end
end

p Clock.new(hour: 23, minute: 66).to_s
p Clock.new(minute: 200).to_s

p clock = Clock.new(hour: 2, minute: 45)
p clock2 = Clock.new(minute: 40)
# (clock + Clock.new(minute: 40)).to_s
