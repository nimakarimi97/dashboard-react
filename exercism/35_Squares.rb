class Squares
  attr_reader :array
  def initialize(number)
    @array = (1..number).to_a
  end

  def square_of_sum
    array.sum**2
  end

  def sum_of_squares
    array.sum { |element| element**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

p Squares.new(5).square_of_sum # 225
p Squares.new(5).sum_of_squares # 55
p Squares.new(5).difference # 170

p Squares.new(12).square_of_sum # 6084
