class Gigasecond
  def self.from(time)
    time + 1e9
  end
end

p Time.utc(2043, 1, 1, 1, 46, 40)
p Gigasecond.from(Time.utc(2011, 4, 25, 0, 0, 0))
