class Transpose
  def self.transpose(input)
    if input == ''
      ''
    else
      line = input.split(/\n/)
      max_line_length = line.map(&:size).max
      line = line.map { |word| word.chars }

      (0...max_line_length).map do |index|
        line.map { |char| char[index] or '' }.join
      end * "\n"
    end
  end
end

input = 'A1'
input = "ABC\n123"
input = "The longest line.\nA long line.\nA longer line.\nA line."
# Expected: "TAAA\nh   \nelll\n ooi\nlnnn\nogge\nn e.\nglr\nei \nsnl\ntei\n .n\nl e\ni .\nn\ne\n."

p Transpose.transpose(input)
