class Grains
  def self.square(n)
    raise ArgumentError if !(1..64).include?(n)
    2**(n - 1)
  end
  def self.total
    (1..64).reduce { |sum, i| sum + square(i) }
  end
end

p Grains.square(5)
p Grains.total
