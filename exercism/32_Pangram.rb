class Pangram
  def self.pangram?(string)
    ('a'..'z').all? { |char| string.downcase.include? (char) }
  end
end

sentence = 'abcdefghijklmnopqrstuvwxyz'
sentence = 'the 1 quick brown fox jumps over the 2 lazy dogs'
p result = Pangram.pangram?(sentence)
