a = %w[a b c d e f g]

a[2, 2] #[index, length]
# .size .sum .reverse

class BirdCount
  def self.last_week
    [0, 2, 5, 3, 7, 8, 4]
  end

  def initialize(birds_per_day)
    @birds = birds_per_day
  end

  def yesterday
    @birds[-2]
  end

  def total
    @birds.sum
  end

  def busy_days
    @birds.count { |number| number >= 5 }
  end

  def day_without_birds?
    @birds.any? { |number| number == 0 }
  end
end

birds_per_day = [2, 5, 0, 7, 4, 1]
bird_count = BirdCount.new(birds_per_day)
puts bird_count.yesterday
# => 4

puts bird_count.total
# => 19

puts bird_count.day_without_birds?

fibonacci = [0, 1, 1, 2, 3, 5, 8, 13]

fibonacci.count { |number| number == 1 } #=> 2
fibonacci.any? { |number| number == 1 } #=> false
fibonacci.select { |number| number.odd? } #=> [1, 1, 3, 5, 13]
fibonacci.all? { |number| number < 20 } #=> true
fibonacci.map { |number| number * 2 } #=> [0, 2, 2, 4, 6, 10, 16, 26]
puts fibonacci.find { |number| number >= 9 } #=> 5
