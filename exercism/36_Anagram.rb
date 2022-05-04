class Anagram
  attr_reader :string, :key
  def initialize(string)
    @string = string
    @key = string.downcase.split('').sort.join
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  def anagram?(word)
    word.downcase != string.downcase && word.downcase.split('').sort.join == key
  end
end

detector = Anagram.new('master')
p anagrams = detector.match(%w[stream pigeon maters])
# expected = %w[maters stream]

detector = Anagram.new('BANANA')
p anagrams = detector.match(%w[BANANA Banana banana])
# expected = %w[]
