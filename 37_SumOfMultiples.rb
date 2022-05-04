class SumOfMultiples
  attr_reader :arguments
  def initialize(*arguments)
    @arguments = arguments
  end

  def to(upper_limit)
    result = []
    (1...upper_limit).each do |num|
      arguments.each { |devider| result << num if num % devider == 0 }
    end
    result.uniq.sum
  end
end

sum_of_multiples = SumOfMultiples.new(3, 5)
p sum_of_multiples.to(100)
# 2_318

sum_of_multiples = SumOfMultiples.new(7, 13, 17)
p sum_of_multiples.to(20) # 51
