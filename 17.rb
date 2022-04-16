class Matrix
  attr_reader :rows, :columns
  def initialize(string)
    @rows = string.each_line.map { |line| line.split.map(&:to_i) }
    @columns = @rows.transpose
  end
end

matrix = Matrix.new("1 2\n10 20")
p matrix.rows
p matrix.columns
