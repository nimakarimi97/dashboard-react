class Hamming
  def self.compute(first, second)
    raise(ArgumentError) if first.length != second.length

    hamming = 0
    first.length.times { |i| hamming += 1 unless first[i] == second[i] }
    hamming

    #* from community
    # (0...first.length).count { |i| first[i] != second[i] }
    # first.chars.zip(second.chars).count { |a, b| a != b }
  end
end

p Hamming.compute('', '')
p Hamming.compute('A', 'A') # 0
p Hamming.compute('GF', 'TJ') # 2
p Hamming.compute('GGACTGAAATCTG', 'GGACTGAAATCTG') # 0
p Hamming.compute('GGACGGATTCTG', 'AGGACGGATTCT') # 9
