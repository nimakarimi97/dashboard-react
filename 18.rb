class Series
  def initialize(input)
    @input = input
  end

  def slices(num)
    raise ArgumentError if num > @input.size
    i = 0
    output = []
    while i + num <= @input.size
      output.push(@input[i...i + num])
      i += 1
    end

    output

    #* from community
    # @input          # assuming n == 2 :
    # .chars          # %w(s t r i n g)
    # .each_cons(num) # [%w(s t), %w(t r), %w(r i), %w(i n), %w(n g)]
    # .map(&:join)    # %w(st tr ri in ng)
  end
end

series = Series.new('01234')
p series.slices(2)
# %w[01 12 23 34], series.slices(2)

series = Series.new('982347')
p series.slices(3)

series = Series.new('01234')
p series.slices(5)
