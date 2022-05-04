class Triangle
  attr_reader :sides
  def initialize(sides)
    @sides = sides
  end

  def triangle?
    sides.min(2).sum >= sides.max
  end

  def equilateral?
    if triangle?
      sides.min == 0 ? false : sides.min == sides.max
    else
      false
    end
    #* another way but I personally think the above lines are more readable
    # sides.min == 0 ? false : sides.uniq.size == 1 && triangle?
  end

  def isosceles?
    triangle? && sides.uniq.size < 3
  end

  def scalene?
    triangle? && sides.uniq.size == 3
  end
end

triangle = Triangle.new([2, 2, 2])
p triangle.equilateral?
triangle = Triangle.new([0, 0, 0])
p triangle.equilateral?

triangle = Triangle.new([3, 4, 3])
p triangle.isosceles?
triangle = Triangle.new([2, 3, 4])
p triangle.isosceles?
p triangle.scalene?

triangle = Triangle.new([3, 4, 4])
p triangle.isosceles?
p triangle.scalene?
